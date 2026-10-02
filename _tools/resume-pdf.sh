#!/bin/sh
set -e
cd "$(dirname "$0")/.."
bundle exec jekyll build --quiet
weasyprint -s _tools/resume-pdf.css _site/resume/index.html kory-hayward-resume.pdf
echo "wrote kory-hayward-resume.pdf"
