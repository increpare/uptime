#!/bin/bash
# Fetch every URL in sites.txt; print one line per failure. Exit 1 if any failed.
fail=0
while read -r url; do
  [ -z "$url" ] && continue
  code=$(curl -s -o /dev/null -w '%{http_code}' --max-time 25 --retry 2 --retry-delay 5 -A "increpare-uptime" "$url" 2>/dev/null) || code="000 (no response or TLS error)" 
  case "$code" in
    2*|3*) ;;
    *) echo "DOWN $code $url"; fail=1 ;;
  esac
done < sites.txt
exit $fail
