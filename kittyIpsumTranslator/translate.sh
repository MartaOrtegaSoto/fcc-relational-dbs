#!/bin/bash

cat $1 | sed -E 's/catnip/dogchow/g; s/cat/dog/g; s/meow|meowzer/woof/g'

# Check the words that were translated:
  # ./translate.sh kitty_ipsum_2.txt | grep -E --color 'woof[a-z]*|dog[a-z]*'
