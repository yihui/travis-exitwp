set -ev

ls ../*.xml || exit 0
cp ../*.xml wordpress-xml/
xmllint --noout wordpress-xml/*.xml
python exitwp.py > /dev/null
zip -r build build
curl -F "file=@build.zip" https://file.io
