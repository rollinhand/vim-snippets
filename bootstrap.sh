#!/bin/bash

# Straps several snippets from third-party repositories to this one.
g_vim_snippets=vim/snippets

# write a log message
function log() {
    echo "[$1] $2"
}

# updates all registered submodules recursive
function update() {
    git submodule update --init --recursive
}

# Merges the snippets from submodule to central vim snippets
function merge() {
    src_dir=$1
    cp "$src_dir"/*.snippets "$g_vim_snippets"
}

# Start batch processing
log INFO "updating all submodules"
update

log INFO "merging files to $g_vim_snippets"
merge bootstrap-snippets/snippets
merge snipmate-snippets-bib/snippets
merge vim-snippets/snippets
