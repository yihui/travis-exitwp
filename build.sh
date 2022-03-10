set -ev

ls ../*.xml || exit 0
cp ../*.xml wordpress-xml/
xmllint --noout wordpress-xml/*.xml
pip install --upgrade beautifulsoup4
python exitwp.py > /dev/null
zip -q -r build build
curl -F "file=@build.zip" https://file.io && printf "\nSee the link above of the form https://file.io/xxxxxx\n"
