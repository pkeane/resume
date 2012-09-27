#!/bin/sh

TODAY=`date +%Y%m%d`


if [[ ! -e $TODAY ]]; then
  mkdir $TODAY
fi

pandoc resume.md -o $TODAY/resume.pdf
pandoc resume.md -o latest.pdf

cp resume.md $TODAY

cat > $TODAY/index.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title> Peter Keane - resume </title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="content">
EOF

pandoc -f markdown -t html resume.md  >> $TODAY/index.html

cat >> $TODAY/index.html <<EOF
</div>
</body>
</html>
EOF

cp style.css $TODAY
