export PATH=/root/.local/bin/fsharp/:$PATH


FSLEXYACC_RUNTIME="/root/.local/bin/fsharp/FsLexYacc.Runtime.dll"

fsc() {
  rm -f "FsLexYacc.Runtime.dll" || true
  fsharpc -r "${FSLEXYACC_RUNTIME}" $@
  cp "${FSLEXYACC_RUNTIME}" .
}
