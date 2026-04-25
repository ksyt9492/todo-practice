#!/bin/bash

ISSUE_NUM=$1

if [ -z "$ISSUE_NUM" ]; then
  echo "사용법: ./start-issue.sh <이슈번호>"
  exit 1
fi

ISSUE_TITLE=$(gh issue view $ISSUE_NUM --json title -q .title)
BRANCH_NAME="feature/issue-${ISSUE_NUM}"

echo "이슈 #$ISSUE_NUM: $ISSUE_TITLE"
echo "브랜치 생성: $BRANCH_NAME"

git checkout main
git pull origin main
git checkout -b $BRANCH_NAME

echo "작업 준비 완료! 브랜치: $BRANCH_NAME"
