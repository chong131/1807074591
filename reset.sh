#!/usr/bin/env bash

git=git
command -v git.exe 1>/dev/null && git=git.exe

$git config user.name "github-actions[bot]"
$git config user.email "41898282+github-actions[bot]@users.noreply.github.com"

[ "$1" = "pull" ] && {
    $git remote add upstream https://github.com/vcheckzen/KeepAliveE5.git
    $git config pull.rebase true
    $git pull upstream master
    $git checkout --ours .
    $git add .
    $git commit -m "$1"
    $git rebase --continue
    exit 0
}

$git checkout --orphan latest_branch
$git rm -rf --cached .
$git add -A
$git commit -m "$1"
$git branch -D master
$git branch -m master
$git push -f origin master
