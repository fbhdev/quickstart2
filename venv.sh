function create_env {
  python3.8 -m venv .venv
  source .venv/bin/activate
}

function install_dependencies {
  pip3 install fastapi pymongo icecream starlette uvicorn python-dotenv
}


mkdir server
touch .env
echo '
  MONGO_URI=""
  DB_NAME=""
'>>.env
create_env
cd ../ || exit