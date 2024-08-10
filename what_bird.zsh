#!/usr/bin/env zsh

function display_help {
  echo "Usage:"
  echo ""
  echo "  $0 to-binomial"
  echo "  $0 from-binomial"
  echo "  $0 (h | --help)"
  echo ""
  echo "Description:"
  echo "  A script to help you convert between common and binomial names of birds."
  echo ""
  echo "Options:"
  echo "  -h, --help    Display this help message."
}

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  display_help
  exit 0
fi

if [[ "$1" == "to-binomial" ]]; then
  awk -F',' '{print $1 "\t" $2}' data.csv | fzf --delimiter='\t' --with-nth=1 | awk -F'\t' '{print $2}'
  exit 0
fi

if [[ "$1" == "from-binomial" ]]; then
  awk -F',' '{print $1 "\t" $2}' data.csv | fzf --delimiter='\t' --with-nth=2 | awk -F'\t' '{print $1}'
  exit 0
fi

display_help
