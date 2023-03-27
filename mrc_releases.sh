mkdir release
cp -r basic release/rime/
cp -r schema/. release/rime/
cp -r ex_dict/. release/rime/
cp -r custom/. release/rime/
7zz a release.zip release
rm -r release