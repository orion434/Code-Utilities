printf "Check PIP and PIP3 versions and packages: \n\n "

if [[ $(command -v pip) ]] ; then 
    printf "PIP found: \n  "
    pip --version ; 
    pip_pkg=$( pip list --outdated --format=freeze | awk '{split($0, a, "=="); print a[1]}' | wc -l)
    printf "  Pakages to be upgraded: $pip_pkg \n"
fi

if [[ $(command -v pip3) ]] ; then 
    printf "PIP3 found: \n  "
    pip3 --version ; 
    pip3_pkg=$( pip list --outdated --format=freeze | awk '{split($0, a, "=="); print a[1]}' | wc -l)
    printf "  Pakages to be upgraded: $pip3_pkg \n"
fi

