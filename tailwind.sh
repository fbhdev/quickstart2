function setup_tailwind() {
 npm install -D tailwindcss postcss autoprefixer
 wait
 npx tailwindcss init -p
}

cd client || exit
setup_tailwind
cd ../ || exit