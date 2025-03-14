#!/usr/bin/env bash

# This script calculates the progress of the project by comparing the numbers of issues corresponding to exercises and
# problems.  The issues are fetched via GitHub API and filtered by specific milestone or label.

gh auth login

# 35 chapters + 4 appendices
chapters_count=$((35+4))

issues_total=0
issues_closed=0

printf '\nCATEGORY\t\tCLOSED\tTOTAL\tRATIO\n\n'

print_progress() {
  progress=$(echo "scale=2; ($2 / $3) * 100" | bc)
  printf '%s\t\t%d\t%d\t%.0f%%\n' "$1" "$2" "$3" "$progress"
}

fetch_issues_count() {
  local query="repo:wojtask/clrs4e-solutions+is:issue"
  for param in "$@"; do
    case $param in
      "c")
        query+="+is:closed"
        ;;
      "+m")
        query+="+label:migratable"
        ;;
      "-m")
        query+="+-label:migratable"
        ;;
      "+f")
        query+="+label:figure"
        ;;
      "-f")
        query+="+-label:figure"
        ;;
      "+i")
        query+="+label:implementation"
        ;;
      "-i")
        query+="+-label:implementation"
        ;;
      "+s")
        query+="+label:starred"
        ;;
      "-s")
        query+="+-label:starred"
        ;;
    esac
  done

  local result
  result="$(gh api \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "/search/issues?q=$query" \
      | jq '.total_count')"
  sleep 2 # this is to avoid rate limits when calling the GitHub API
  echo "$result"
}

for (( chapter_milestone_number = 3; chapter_milestone_number < 3 + chapters_count; chapter_milestone_number ++ )); do
  response=$(gh api \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "/repos/wojtask/clrs4e-solutions/milestones/$chapter_milestone_number")
  sleep 1 # this is to avoid rate limits when calling the GitHub API

  title=$(echo "$response" | jq -r '.title')
  chapter_open=$(echo "$response" | jq -r '.open_issues')
  chapter_closed=$(echo "$response" | jq -r '.closed_issues')
  chapter_total=$((chapter_open + chapter_closed))

  print_progress "$title" "$chapter_closed" "$chapter_total"

  issues_closed=$((issues_closed + chapter_closed))
  issues_total=$((issues_total + chapter_total))
done

printf '\n'

m_total=$(fetch_issues_count +m)
m_closed=$(fetch_issues_count c +m)
print_progress "Migratable " "$m_closed" "$m_total"

f_total=$(fetch_issues_count +f)
f_closed=$(fetch_issues_count c +f)
print_progress "Figures " "$f_closed" "$f_total"

i_total=$(fetch_issues_count +i)
i_closed=$(fetch_issues_count c +i)
print_progress "Implementations" "$i_closed" "$i_total"

s_total=$(fetch_issues_count +s)
s_closed=$(fetch_issues_count c +s)
print_progress "Starred " "$s_closed" "$s_total"

printf '\n'
print_progress "Total   " "$issues_closed" "$issues_total"

# regular task weight (i.e., not migratable, no other modifiers)
# 2 was chosen so that the weight of migratable tasks which is halved, is integer
r_weight=2

# migratable task weight; it's assumed that a migration is about a half amount of work on a regular task
m_weight=1

# weights of a single modifier: figure, implementation or star
f_weight=$r_weight
i_weight=$r_weight
s_weight=$r_weight

# weights of nonmigratable tasks with a single modifier: figure, implementation or star
rf_weight=$((r_weight + f_weight))
ri_weight=$((r_weight * i_weight))
rs_weight=$((r_weight * s_weight))

# weights of migratable tasks with a single modifier: figure, implementation or star
mf_weight=$((m_weight + f_weight))
mi_weight=$((m_weight + i_weight))
# star shouldn't affect the migration (the task was already solved)
ms_weight=$m_weight

# weights of tasks with exactly two modifiers
rfi_weight=$((r_weight + f_weight + i_weight))
rfs_weight=$((r_weight + f_weight + s_weight))
ris_weight=$((r_weight + i_weight + s_weight))
mfi_weight=$((m_weight + f_weight + i_weight))
mfs_weight=$mf_weight
mis_weight=$mi_weight

# weights of tasks with all three modifiers
rfis_weight=$((r_weight + f_weight + i_weight + s_weight))
mfis_weight=$mfi_weight

weighted_total=0
((weighted_total=weighted_total+$(($(fetch_issues_count -m -f -i -s) * r_weight))))
((weighted_total=weighted_total+$((m_total * m_weight))))
((weighted_total=weighted_total+$((f_total * rf_weight))))
((weighted_total=weighted_total+$((i_total * ri_weight))))
((weighted_total=weighted_total+$((s_total * rs_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count +m +f -i -s) * mf_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count +m -f +i -s) * mi_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count +m -f -i +s) * ms_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count -m +f +i -s) * rfi_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count -m +f -i +s) * rfs_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count -m -f +i +s) * ris_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count +m +f +i -s) * mfi_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count +m +f -i +s) * mfs_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count +m -f +i +s) * mis_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count -m +f +i +s) * rfis_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count +m +f +i +s) * mfis_weight))))

weighted_closed=0
((weighted_closed=weighted_closed+$(($(fetch_issues_count c -m -f -i -s) * r_weight))))
((weighted_closed=weighted_closed+$((m_closed * m_weight))))
((weighted_closed=weighted_closed+$((f_closed * rf_weight))))
((weighted_closed=weighted_closed+$((i_closed * ri_weight))))
((weighted_closed=weighted_closed+$((s_closed * rs_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c +m +f -i -s) * mf_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c +m -f +i -s) * mi_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c +m -f -i +s) * ms_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c -m +f +i -s) * rfi_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c -m +f -i +s) * rfs_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c -m -f +i +s) * ris_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c +m +f +i -s) * mfi_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c +m +f -i +s) * mfs_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c +m -f +i +s) * mis_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c -m +f +i +s) * rfis_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c +m +f +i +s) * mfis_weight))))

printf '\n'
print_progress "Weighted" "$weighted_closed" "$weighted_total"
