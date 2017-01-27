# All kind of bash aliases


# Editing
alias e='vim -O'
alias d='vim -d'


# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ack='ack-grep'


# Finding files
alias fgr='find . | xargs grep -i -n -s \!*'
alias fgr_sym='find . | xargs grep -i -n -s \!*'


#Last changes
function find_last_changes() {
    find "$1" -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -nr | cut -d: -f2-
}

function find_my_files() {
    find "$1" -user ${USER} -type f -print0 | xargs -0 stat --format '%n' | sort -nr | cut -d: -f2- | grep -v '\.cmake\.state' | grep -v '\..\+\.swp'
}

function inotify_pytest() {

while inotifywait -r --exclude='.*.swp' -e modify . ; do
    pytest
    # Wait a little bit before rescheduling
    sleep 5
done

}

# Repeat a command: usage: repeat_me <iterations> <time_to_sleep> <command>
#                   example: >repeat_me 5 30s echo bla
#function repeat_me() {
#   repeat "$1" echo `"$3*" && sleep "$2"`
#}
#

# Fun
alias is_het_al_vrijdag=date\ \+\%A\ \|\ awk\ \''{ print ($1 == "Friday") ? "Ja!" : "Nee, helaas" }'\'
alias weeknummer='date +%V'
