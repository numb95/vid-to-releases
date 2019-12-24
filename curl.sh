#!/bin/bash
if [ $# -eq 0 ]; then
  echo "No arguments supplied"
  exit 1
fi
for ((c = 1; c <= 5; c++)); do
  status_code=$(curl --write-out %{http_code} --silent --output /dev/null $1)

  if [[ "$status_code" -ne 200 && "$status_code" -ne 301 && "$status_code" -ne 302 ]]; then
    echo "Check Url, $c times"
  else
    exit 0
  fi

  echo "Url not found, Status code $status_code"
done
