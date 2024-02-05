function set_up_vite() {
 yarn create vite client --template react-ts
}

set_up_vite
cd client || exit
npm install
cd ../ || exit