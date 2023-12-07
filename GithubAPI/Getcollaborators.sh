#!/bin/bash

############################
Author : Divyam Sharma
This script will help users to retrieve information from Github
Usage: Please provide your github token and rest api to script as input

#############################

if [ ${#@} -lt 2 ]; then
    echo "usage: $0 [your github token] [REST expression]";
    exit 1;
fi
API_URL="https://api.github.com"

USERNAME= $username
TOKEN= $token
GITHUB_OWNER=$1
GITHUB_REPO_NAME=$2


#### Creating a function to make the REST API hit


GITHUB_API_URL=   "https://api.github.com//repos/GITHUB_OWNER/GITHUB_REPO_NAME/collaborators"

response= $(curl -s -H "Authorization: token ${TOKEN}" "${GITHUB_API_URL}")

if [$? -ne 0]; then
    echo "Error: Unable to fetch collaborators. Please check your GitHub token and repository name."
    exit 1
fi
collaborators=$(echo "${response}" | jq -r '.[].login')

echo "Collaborators for ${REPO_NAME}:"
echo "${collaborators}"



