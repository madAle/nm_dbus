#!/bin/bash

usage() {
  echo "Usage: $0 -a <target IP addr> [-u <ssh user>] [-p <ssh server port>]" 1>&2
  exit 1
}

SCRIPT_PATH="$(
  cd "$(dirname "$0")" >/dev/null 2>&1
  pwd -P
)"

# Load utility files.
source ${SCRIPT_PATH}/dsl.sh

# Load .env
if [ -f ${SCRIPT_PATH}/.env ]
then
  export $(cat ${SCRIPT_PATH}/.env | xargs)
fi

while getopts a:u:p:h:f:y:g:b: option; do
  case "${option}" in
  a) TARGETADDR=${OPTARG} ;;
  u) SSH_USER=${OPTARG} ;;
  p) SSH_PORT=${OPTARG} ;;
  h) usage ;;
  f) REMOTE_FS_PATH=${OPTARG} ;;
  y) REMOTE_RUBY_BIN_PATH=${OPTARG} ;;
  g) REMOTE_GEM_HOME=${OPTARG} ;;
  b) REMOTE_BUNDLE_PATH=${OPTARG} ;;
  *) usage ;;
  esac
done

do_rsync -R "$@" $SSH_USER@$TARGETADDR:$REMOTE_FS_PATH

folders_list=""
for path in "$@"
do
    parent_folder=$(echo "$path" | cut -d "/" -f1 -s)
    folders_list="${folders_list} ${REMOTE_FS_PATH}/${parent_folder}"
done

ssh_do "cd $REMOTE_FS_PATH; sudo chown -R $SSH_USER ${@}"
