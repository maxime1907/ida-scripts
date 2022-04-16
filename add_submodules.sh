for d in `find . -maxdepth 1 -mindepth 1 -type d`
do
    export url=$(git -C $d config --get remote.origin.url)
    if [[ $url == *"plugins.git"* ]]; then
        continue;
    fi
    echo $url $d
    git rm -f -r --cached $d
    git submodule add $url $d
done

