function create_resource {
  touch resource.py
  echo "
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from process import Process

# from starlette.responses import Response
# from starlette.requests import Request

load_dotenv()
app = FastAPI()
ALL = ['*']
app.add_middleware(
    CORSMiddleware,
    allow_credentials=True,
    allow_origins=ALL,
    allow_methods=ALL,
    allow_headers=ALL,
)


# GET http://localhost:8000/
@app.get('/')
async def root() -> None:
    return {}
  " >>resource.py
}

cd server || exit
create_resource
cd ../ || exit