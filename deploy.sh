#! /usr/bin/env bash

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green


function log() {

    printf ">> ${1}\n"
}

function log_info() {
    log "${Green}${1}${Color_Off}"
}


function log_error() {
    log "${Red}${1}${Color_Off}"
}

function die() {
     log_error "Something went wrong"
     exit 1
}

function symlink() {

    FROM="${1}"
    TO="${2}"

    log_info "Trying to link ${FROM} to ${TO}"
    ln -s "${FROM}" "${TO}"
}

################################################################################

# Get environment paths
SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`
PROJECTDIR=$(pwd)

function deploy_vim () {

    symlink "${PROJECTDIR}"/.vimrc ~/.vimrc
    symlink "${PROJECTDIR}"/.vim   ~/.vim
}


function deploy_bash() {

    symlink "${PROJECTDIR}"/.bash_aliases ~/.bash_aliases
}

function deploy_rc() {

    symlink "${PROJECTDIR}"/.ackrc ~/.ackrc
}


deploy_vim
deploy_bash
deploy_rc

