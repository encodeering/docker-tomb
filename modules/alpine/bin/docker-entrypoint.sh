#!/usr/bin/env bash

[ $# -gt 0 ] && tomb open $@

zsh

tomb close all || tomb slam all
