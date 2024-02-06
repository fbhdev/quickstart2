bash venv.sh
bash resource.sh
bash process.sh
bash database.sh
bash resource.sh
bash server-utils.sh
bash template.sh
bash models.sh

cd server || exit
touch requirements.txt
echo "fastapi~=0.103.1
starlette~=0.27.0
python-dotenv~=1.0.0
pymongo~=4.5.0
uvicorn~=0.22.0
icecream~=2.1.3">>requirements.txt
cd ../ || exit