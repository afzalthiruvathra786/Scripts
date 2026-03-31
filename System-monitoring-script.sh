#!/bin/bash

THRESHOLD=80

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
DISK=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

echo "CPU Usage: $CPU%"
echo "Memory Usage: $MEM%"
echo "Disk Usage: $DISK%"

if (( $(echo "$CPU > $THRESHOLD" | bc -l) )); then
  echo "High CPU usage! $CPU %"
fi

if (( $(echo "$MEM > $THRESHOLD" | bc -l) )); then
  echo "High Memory usage! $MEM %"
fi

if [ "$DISK" -gt "$THRESHOLD" ]; then
  echo "Disk usage is high! $DISK %"
fi
