#!/bin/bash
sudo -E apt-get -qq update
sudo -E apt-get -qq install git openjdk-8-jdk wget expect yarn
pip install pyrogram tgcrypto
