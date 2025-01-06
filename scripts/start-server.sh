#!/bin/bash
# Replace HOST_IP with the IP from the Host - only works when container is ran on host interface!
if grep -q "HOST_IP" <<< "${NTFY_MESSAGE}" ; then
  HOST_IP=$(hostname -I | awk '{print $1}')
  NTFY_MESSAGE=$(sed "s/HOST_IP/${HOST_IP}/" <<< "${NTFY_MESSAGE}")
fi

echo "---Sending ntfy message to server address: '${NTFY_URL}' at topic: '${NTFY_TOPIC}' with title: '${NTFY_TITLE}' and message: '${NTFY_MESSAGE}'---"

curl \
  -H "Title: ${NTFY_TITLE}" \
  -H "Priority: ${NTFY_PRIORITY}" \
  -H "Authorization: Bearer ${NTFY_ACCESS_TOKEN}" \
  -H "Tags: tada" \
  -d "${NTFY_MESSAGE}" \
  "${NTFY_URL}/${NTFY_TOPIC}"

echo "--- D O N E ---"
