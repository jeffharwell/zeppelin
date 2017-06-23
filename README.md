# zeppelin
Apache Zeppelin Docker Image - an update of the Google Container Registry Zeppelin Image

This container is based on gcr.io/google-containers/zeppelin:v0.5.6_v1. My main goal was to update the Zeppelin version, which is 0.7.2 at the time of this writing. The goal is that it will be a drop-in replacement for the GCR image.

I'm not using the official apache/zeppelin image because I don't want to include an entire Spark installation in the image since my use case is to run it inside of a Kubernetics cluster that already has Spark running.

The GCR image is built on Debian Jessie 8.2

Currently I have all the interperters installed, which makes the image pretty big. I may clean this up in the future.
