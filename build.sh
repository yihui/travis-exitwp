set -ev

ls ../*.xml || exit 0
cp ../*.xml wordpress-xml/
xmllint --noout wordpress-xml/*.xml
pip install --upgrade beautifulsoup4
python exitwp.py > /dev/null
zip -q -r build build
mv build.zip ../
