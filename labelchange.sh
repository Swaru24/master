#!/bin/bash
sed "s/tagVersion/$1/g" pods.yml > my-Firstapp-pod.yml
