function git::is_stashed
  command git rev-parse --verify --quiet refs/stash >/dev/null
end

function git::get_ahead_count
  echo (command git log 2> /dev/null | grep '^commit' | wc -l | tr -d " ")
end

function git::branch_name
  command git symbolic-ref --short HEAD
end

function git::is_touched
  test -n (echo (command git status --porcelain))
end

function fish_prompt
  test $status -ne 0;
    and set -l colors 600 900 c00
    or set -l colors 333 666 aaa

  set -l pwd (prompt_pwd)
  set -l base (basename "$pwd")

  set -l expr "s|~|"(__batman_color_fst)"^^"(__batman_color_off)"|g; \
               s|/|"(__batman_color_snd)"/"(__batman_color_off)"|g;  \
               s|"$base"|"(__batman_color_fst)$base(__batman_color_off)" |g"

  echo -n (echo "$pwd" | sed -e $expr)(__batman_color_off)

  if git rev-parse 2> /dev/null
    git::is_stashed; and echo (__batman_color_trd)"^"(__batman_color_off)
    printf (__batman_color_snd)"("(begin
      if git::is_touched
        echo (__batman_color_trd)"*"(__batman_color_off)
      else
        echo ""
      end
    end)(__batman_color_fst)(git::branch_name)(__batman_color_snd)(begin
      set -l count (git::get_ahead_count)
        if test $count -eq 0
          echo ""
        else
          echo (__batman_color_trd)"+"(__batman_color_fst)$count
        end
    end)(__batman_color_snd)") "(__batman_color_off)
  end

  for color in $colors
    echo -n (set_color $color)">"
  end

  echo -n " "
end
