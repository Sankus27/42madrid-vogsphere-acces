#!/bin/bash

### We set up the user used to access to the vogsphere

mkdir -p ~/.ssh &&
cat >> ~/.ssh/config << EOF
Host vgs vgs.42madrid.com vgse vgse.42madrid.com vogsphere vogsphere.42madrid.com vogsphere-exam vogsphere-exam.42madrid.com
	User vogsphere
EOF

echo "user part finished, welcome to freedom !"
