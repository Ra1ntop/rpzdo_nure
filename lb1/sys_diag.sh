#!/usr/bin/env bash
# Збирає базову діагностику системи.

set -euo pipefail

echo "=== System Diagnostics ==="
echo "Hostname: $(hostname)"
echo

echo "--- Network Interfaces & IPs ---"
# IPv4 and IPv6
if command -v ip >/dev/null 2>&1; then
  ip -brief addr show | awk '{iface=$1; state=$2;
    for (i=3;i<=NF;i++){print iface": " $i" ("state")"} }'
else
  # Fallback for ifconfig
  ifconfig | awk '/^[a-z0-9]/ {iface=$1} /inet /{print iface": "$2" (UP)"} /inet6 /{print iface": "$2" (UP)"}'
fi
echo

echo "--- Kernel Version ---"
uname -r
echo

echo "--- Uptime ---"
if uptime -p >/dev/null 2>&1; then
  uptime -p
else
  uptime
fi
echo

echo "--- Current User ---"
whoami
