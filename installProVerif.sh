# Script for installation of ProVerif on a completely
# fresh Ubuntu installation (e.g. in a virtual machine)

set -e # Abort if one of the commands fail
set -x # Print commands as they are executed

# Install dependencies
apt-get -y update
apt install -y graphviz ocaml-nox liblablgtk2-ocaml-dev opam  
apt install -y ocaml-findlib 
apt-get install wget

# Hopefully nothing else should be required. If this is not the case,
# and you are required to do something, please let me know, 
# so that I can update this

# Download the latest documentation (including code examples used in the manual)
wget https://bblanche.gitlabpages.inria.fr/proverif/proverifdoc2.04.tar.gz
tar -xf proverifdoc2.04.tar.gz

# Download the latest version from INRIA website
wget http://prosecco.gforge.inria.fr/personal/bblanche/proverif/proverif2.04.tar.gz 

tar -xf proverif2.04.tar.gz 
cd proverif2.04/ 
./build 

# optionally run tests (all tests should display "OK")
# Expected runtimes of some tests (in folder examples/pitype/ffgg) are missing in the release 2.04. 
# So it will show "Expected runtime not found in script file". Don't worry.
./test 

# and install binaries (Run from within the same folder) 
install -Dm755 proverif /usr/local/bin/proverif 
install -Dm755 proveriftotex /usr/local/bin/proveriftotex 
install -Dm755 proverif_interact /usr/local/bin/proverif_interact 

# display list of options 
proverif -help 