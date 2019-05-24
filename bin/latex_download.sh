DEPENDENCIES=(
  mathtoolsgraphicx
)
PACKAGES=()

echo $DEPENDENCIES 
# Loop over all the dependencies
for dependency in "${DEPENDENCIES[@]}"; do
    # Check dnf for the parent package and trim its output
    PACKAGES+=($(
        dnf provides "tex($dependency.sty)" \
            | awk -F':' '/^texlive/{ gsub("-[0-9]+$", "", $1); print $1 }'
     #    dpkg -S "tex($dependency.sty)" \
    ))
done
# Remove duplicates
PACKAGES=($(echo "${PACKAGES[@]}" | tr ' ' '\n' | sort -u))
# Install dependencies
sudo dnf install "${PACKAGES[@]}"
#sudo apt install "${PACKAGES[@]}"
