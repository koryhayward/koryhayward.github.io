#!/bin/sh
set -e
cd "$(dirname "$0")/.."
case "$1" in
  on)
    sed -i '' 's/^resume: false$/resume: true/' _config.yml
    sed -i '' '/^\/resume\.md$/d; /^\/kory-hayward-resume\.pdf$/d' .gitignore
    ./_tools/resume-pdf.sh
    git add _config.yml .gitignore resume.md kory-hayward-resume.pdf
    git commit -q -m "résumé: show /resume/ and the PDF"
    echo "résumé is ON locally and committed. To publish it, run: git push"
    ;;
  off)
    sed -i '' 's/^resume: true$/resume: false/' _config.yml
    grep -qx '/resume.md' .gitignore || echo '/resume.md' >> .gitignore
    grep -qx '/kory-hayward-resume.pdf' .gitignore || echo '/kory-hayward-resume.pdf' >> .gitignore
    git rm -q --cached --ignore-unmatch resume.md kory-hayward-resume.pdf
    git add _config.yml .gitignore
    git commit -q -m "résumé: hide /resume/ (files kept locally, not in the repo)"
    echo "résumé is OFF and committed. To take it down, run: git push"
    ;;
  *)
    echo "usage: _tools/resume.sh on|off"
    grep '^resume:' _config.yml
    exit 1
    ;;
esac
