#!/usr/bin/env bash
set -euo pipefail

dir="${1:-next}"      # next or prev
mode="${2:-active}"   # active or all
action="${3:-focus}"  # focus or move

# Handle arguments if action is passed as 2nd parameter
if [[ "$mode" == "move" ]]; then
  action="move"
  mode="active"
fi

current=$(hyprctl activeworkspace -j | jq -r '.name // empty')

target=$(hyprctl workspaces -j | jq -r --arg dir "$dir" --arg cur "$current" --arg mode "$mode" '
  def score:
    if (test("^[A-Z]$")) then [0, .]
    elif (test("^[0-9]+$")) then [1, tonumber]
    else [2, .]
    end;

  if $mode == "active" then
    [.[] | select((.windows > 0) and (.name | startswith("special:") | not)) | .name]
  else
    ([.[] | select(.name | startswith("special:") | not) | .name])
  end
  | unique
  | sort_by(score)
  | . as $list
  | if ($list | length) == 0 then ""
    else
      ($list | index($cur)) as $idx
      | if $idx != null then
          if $dir == "next" then
            $list[($idx + 1) % ($list | length)]
          else
            $list[($idx - 1 + ($list | length)) % ($list | length)]
          end
        else
          ($cur | score) as $cur_score
          | if $dir == "next" then
              ([$list[] | select((. | score) > $cur_score)] | first) // $list[0]
            else
              ([$list[] | select((. | score) < $cur_score)] | last) // $list[-1]
            end
        end
    end
')

if [[ -z "$target" ]]; then
  exit 0
fi

ws_arg="$target"
if [[ ! "$target" =~ ^[0-9]+$ ]] && [[ ! "$target" =~ ^name: ]] && [[ ! "$target" =~ ^special: ]]; then
  ws_arg="name:$target"
fi

if [[ "$action" == "move" ]]; then
  hyprctl dispatch "hl.dsp.window.move({ workspace = \"$ws_arg\" })"
else
  hyprctl dispatch "hl.dsp.focus({ workspace = \"$ws_arg\" })"
fi
