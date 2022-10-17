FILENAME="./reponames.txt"
LINES=$(cat $FILENAME)
for LINE in $LINES
do
    git clone "git@github.com:Moesen/"$LINE
done
