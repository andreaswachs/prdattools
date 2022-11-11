# The /fsharp directory
FSHARP=/root/fsharp

# Update $PATH
export PATH=$FSHARP:$PATH

export FSLEXYACC_RUNTIME="$FSHARP/FsLexYacc.Runtime.dll"

get_deps() {
  cp $FSLEXYACC_RUNTIME .
}


