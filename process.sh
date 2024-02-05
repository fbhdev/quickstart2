function create_process {
  touch process.py
  echo "import os
from dotenv import load_dotenv
from database import Database
from utils import Status
from template import Template

class Process:

  load_dotenv()
  _MONGO_URI: str = os.getenv('MONGO_URI')
  _DB_NAME: str = os.getenv('DB_NAME')
  _INSTANCE: 'Process' = None
  _DB = Database(_MONGO_URI, _DB_NAME)

  def __new__(cls, *args, **kwargs) -> 'Process':
      if not cls._INSTANCE:
          cls._instance = super(Process, cls).__new__(cls, *args, **kwargs)
      return cls._INSTANCE

  @staticmethod
  async def results(collection: str) -> dict:
      if not collection:
        return Template.generate(status=Status.INTERNAL_SERVER_ERROR)
      Process._DB.collection = collection
      results = await Process._DB.find_documents()
      if not results:
          return Template.generate(status=Status.INTERNAL_SERVER_ERROR)
      return Template.generate(status=Status.OK, results=results)
  " >>process.py
}


cd server || exit
create_process
cd ../ || exit