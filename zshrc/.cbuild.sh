FOLDER_NAME="build/"
PATH_PRONOUN="."

if [[ ${#1} != 0 ]]; then
    PATH=$1
fi

full_path=$PATH_PRONOUN/$FOLDER_NAME

echo "# Creating folder $full_path"
if [[ -d $full_path ]]; then
    echo "#    $full_path already exists"
    echo "#    skipping and building in existing folder"
else
mkdir $full_path
fi

echo "#"
echo "# Doing the cmake"
echo "#    command: cmake -S . -B $full_path"

cmake . -B $full_path
make -j 8 -C $full_path

