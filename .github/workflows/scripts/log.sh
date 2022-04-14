#!/bin/bash

for var in "$@"; do
  printf "[LOG]: %s \n" "$var"
done