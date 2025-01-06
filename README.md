# Basic ntfy notification when the Container is started in Docker optimized for Unraid

This is a simple container that sends a message when the container is started (needed this for a headless machine to
know when I can connect or better speaking start up the VM's with WOL).

If using the string `HOST_IP` in the message text the container will try to replace this string with the Host IP
address - this will only work when the container is run on the host network!

## Env params

| Name              | Value                                                                                                                                                | Example               |
|-------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------|
| NTFY_URL          | ntfy Server URL (without trailing slash)                                                                                                             | https://ntfy.sh       |
| NTFY_ACCESS_TOKEN | [ntfy Access Token](https://docs.ntfy.sh/publish/?h=prio#access-tokens)                                                                              | YOURSECRETACCESSTOKEN |
| NTFY_TOPIC        | ntfy Topic                                                                                                                                           | server                |
| NTFY_TITLE        | Customized ntfy Message Title                                                                                                                        | Startup Complete      |
| NTFY_MESSAGE      | Customized ntfy Message                                                                                                                              | Server is now Online! |
| NTFY_PRIORITY     | Customize the [ntfy Priority](https://docs.ntfy.sh/publish/?h=prio#message-priority) ('1': Low Priority ; '3': Normal Priority ; '5': High Priority) | 3                     |

## Run example

```
docker run --name NtfyOnStart -d \
    --env 'NTFY_URL=YOURNTFYURL' \
    --env 'NTFY_ACCESS_TOKEN=YOURSECRETACCESSTOKEN' \
    --env 'NTFY_TOPIC=server' \
    --env 'NTFY_TITLE=Startup Complete' \
    --env 'NTFY_MESSAGE=Server is now Online!' \
    --env 'NTFY_PRIORITY=3' \
    --net='host' \
    nwithan8/ntfy-on-start
```

#### Support Thread: https://forums.unraid.net/topic/133764-support-grtgbln-docker-templates/
