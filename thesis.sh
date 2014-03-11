#!/bin/sh 
set -e

sudo add-apt-repository ppa:avsm/ppa
sudo apt-get update
sudo apt-get install ocaml opam
