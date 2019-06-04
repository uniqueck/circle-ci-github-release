#!/bin/sh

BOT_URL="https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage"

GITHUB_RELEASE_URL="https://github.com/${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME}/releases/tag/${CIRCLE_TAG}"

PARSE_MODE="Markdown"

send_msg () {
    curl -s -X POST ${BOT_URL} -d chat_id=${TELEGRAM_CHAT_ID} \
        -d text="$1" -d parse_mode=${PARSE_MODE}
}


send_msg "
-------------------------------------
Release: *${CIRCLE_TAG}*
[Download Release Artifacts here](${GITHUB_RELEASE_URL})
--------------------------------------
"