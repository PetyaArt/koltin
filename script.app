#!/bin/bash

MERGED_ON_REMOTE=$(git branch --merged master)

echo "$MERGED_ON_REMOTE" >> fileName