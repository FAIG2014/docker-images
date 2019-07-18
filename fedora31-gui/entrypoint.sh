#!/bin/bash



USER_ID=${LOCAL_USER_ID:-1000}
USER_HOME=${LOCAL_USER_HOME:-/home/user}
USER_NAME=${LOCAL_USER_NAME:-user}

GROUP_OPTION=""

useradd --shell /usr/bin/bash -m -u $USER_ID -d $USER_HOME -o -c "" $GROUP_OPTION $USER_NAME 2> /dev/null
export HOME=$USER_HOME
chown $USER_ID $USER_HOME
cp /usr/.bashrc $USER_HOME

if [ "${USER_NAME}" != "user" -a -e /etc/sudoers.d/user ] ; then
    echo "${USER_NAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/user
fi


exec /usr/local/bin/gosu $USER_NAME "$@"

