printf 'building...\n'

function install(){
  local cwd=$(pwd)
  local dname=$(dirname "$cwd")

  cd "$dname"
  git pull

  clean=$(npm run clean)
  generate=$(npm run build)
  deploy=$(npm run deploy)

  echo $clean
  echo $generate
  echo deploy

}

install
