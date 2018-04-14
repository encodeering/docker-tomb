#!/usr/bin/env bash

[ $# -gt 0 ] && tomb open $@

docker-exec zsh

tomb close all || tomb slam all
