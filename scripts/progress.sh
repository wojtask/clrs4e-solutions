#!/usr/bin/env bash

# This script calculates the progress of the project by comparing the numbers of issues corresponding to exercises and
# problems.  The issues are fetched via GitHub API and filtered by specific milestone or label.

gh auth login

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
  local mq="-label:migratable"
  local pq="-label:picture"
  local iq="-label:implementation"
  local sq="-label:starred"
  for param in "$@"; do
    case $param in
      "c")
        query+="+is:closed"
        ;;
      "m")
        mq=${mq:1} # remove the '-' at the beginning
        ;;
      "p")
        pq=${pq:1}
        ;;
      "i")
        iq=${iq:1}
        ;;
      "s")
        sq=${sq:1}
        ;;
    esac
  done
  query+="+${mq}+${pq}+${iq}+${sq}"

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

m_total=$(fetch_issues_count m)
m_closed=$(fetch_issues_count m c)
print_progress "Migratable " "$m_closed" "$m_total"

p_total=$(fetch_issues_count p)
p_closed=$(fetch_issues_count p c)
print_progress "Pictures" "$p_closed" "$p_total"

i_total=$(fetch_issues_count i)
i_closed=$(fetch_issues_count i c)
print_progress "Implementations" "$i_closed" "$i_total"

s_total=$(fetch_issues_count s)
s_closed=$(fetch_issues_count s c)
print_progress "Starred " "$s_closed" "$s_total"

printf '\n'
print_progress "Total   " "$issues_closed" "$issues_total"

# regular task weight (i.e., not migratable, no other modifiers)
# 2 was chosen so that the weight of migratable tasks which is halved, is integer
r_weight=2

# migratable task weight; it's assumed that a migration is about a half amount of work on a regular task
m_weight=1

# weights of a single modifier: picture, implementation or star
p_weight=$r_weight
i_weight=$r_weight
s_weight=$r_weight

# weights of nonmigratable tasks with a single modifier: picture, implementation or star
rp_weight=$((r_weight + p_weight))
ri_weight=$((r_weight * i_weight))
rs_weight=$((r_weight * s_weight))

# weights of migratable tasks with a single modifier: picture, implementation or star
mp_weight=$((m_weight + p_weight))
mi_weight=$((m_weight + i_weight))
# star shouldn't affect the migration (the task was already solved)
ms_weight=$m_weight

# weights of tasks with exactly two modifiers
rpi_weight=$((r_weight + p_weight + i_weight))
rps_weight=$((r_weight + p_weight + s_weight))
ris_weight=$((r_weight + i_weight + s_weight))
mpi_weight=$((m_weight + p_weight + i_weight))
mps_weight=$mp_weight
mis_weight=$mi_weight

# weights of tasks with all three modifiers
rpis_weight=$((r_weight + p_weight + i_weight + s_weight))
mpis_weight=$mpi_weight

weighted_total=0
((weighted_total=weighted_total+$(($(fetch_issues_count) * r_weight))))
((weighted_total=weighted_total+$((m_total * m_weight))))
((weighted_total=weighted_total+$((p_total * rp_weight))))
((weighted_total=weighted_total+$((i_total * ri_weight))))
((weighted_total=weighted_total+$((s_total * rs_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count m p) * mp_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count m i) * mi_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count m s) * ms_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count p i) * rpi_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count p s) * rps_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count i s) * ris_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count m p i) * mpi_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count m p s) * mps_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count m i s) * mis_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count p i s) * rpis_weight))))
((weighted_total=weighted_total+$(($(fetch_issues_count m p i s) * mpis_weight))))

weighted_closed=0
((weighted_closed=weighted_closed+$(($(fetch_issues_count c) * r_weight))))
((weighted_closed=weighted_closed+$((m_closed * m_weight))))
((weighted_closed=weighted_closed+$((p_closed * rp_weight))))
((weighted_closed=weighted_closed+$((i_closed * ri_weight))))
((weighted_closed=weighted_closed+$((s_closed * rs_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c m p) * mp_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c m i) * mi_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c m s) * ms_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c p i) * rpi_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c p s) * rps_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c i s) * ris_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c m p i) * mpi_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c m p s) * mps_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c m i s) * mis_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c p i s) * rpis_weight))))
((weighted_closed=weighted_closed+$(($(fetch_issues_count c m p i s) * mpis_weight))))

printf '\n'
print_progress "Weighted" "$weighted_closed" "$weighted_total"
