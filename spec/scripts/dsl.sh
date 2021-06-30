IGNORE_ERRORS=false

function create_colors {
  COL_RESET="\e[0m"
  COL_RED="\e[31m"
  COL_GREEN="\e[32m"
  COL_YELLOW="\e[33m"
  COL_BLUE="\e[34m"
  COL_MAGENTA="\e[35m"
  COL_PURPLE="\e[35m"
  COL_CYAN="\e[36m"
  COL_LIGHTGRAY="\e[37m"
  COL_LRED="\e[31m"
  COL_LGREEN="\e[32m"
  COL_LYELLOW="\e[33m"
  COL_LBLUE="\e[34m"
  COL_LMAGENTA="\e[35m"
  COL_LPURPLE="\e[35m"
  COL_LCYAN="\e[36m"
  COL_WHITE="\e[37m"
}
create_colors

function do_flash {
  printf "${COL_GREEN}$*${COL_RESET}"
}

function ssh_do {
  ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $SSH_USER@$TARGETADDR -p $SSH_PORT "$@"
}

function do_rsync {
  rsync -e "ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p $SSH_PORT" --rsync-path="sudo rsync" "$@"
}

function ignoring_errors {
  IGNORE_ERRORS=true
  "$@"
  IGNORE_ERRORS=false
}

function optional {
  if [ "$SKIP_OPTIONAL_STEPS" -ne "1" ]
  then
    "$@"
  fi
}
