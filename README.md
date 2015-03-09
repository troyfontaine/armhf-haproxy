# Dockerfile for HAProxy on ARMHF
Dockerfile for setting up an HAProxy container on ARMHF (compatible with Raspberry Pi 2 Model B)

## Base Docker Image
<a href="">armv7/armhf-ubuntu

## Installation
1. Install Docker
2. Download the pre-built image from the Docker Hub Registry: `docker pull troyfontaine/armhf-haproxy` (alternately, you can build an image from Dockerfile: `docker build -t="troyfontaine/armhf-haproxy" github.com/troyfontaine/armhf-haproxy`)

## Usage
`docker run -d -p 80:80 troyfontaine/armhf-haproxy`

## Attach persistent/shared directories
`docker run -d -p 80:80 -v <local/file/override>:/haproxy-override -v <local/file/ssl>:/etc/ssl troyfontaine/armhf-haproxy`
