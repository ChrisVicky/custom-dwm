
files=`ls ./patches`
for f in ${files}
do
	git apply --stat ./patches/${f}
done
sudo make clean  && sudo make install
