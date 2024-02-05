function resolve_config() {
  rm vite.config.ts
  echo '
  import path from "path"
  import react from "@vitejs/plugin-react"
  import { defineConfig } from "vite"

  export default defineConfig({
    plugins: [react()],
    resolve: {
      alias: {
        "@": path.resolve(__dirname, "./src"),
      },
    },
  })' >>vite.config.ts
}

cd client || exit
npm i -D @types/node
resolve_config
echo 'Yes for TypeScript'
echo 'tailwind.config.js is your Tailwind Config File.'
echo 'src/index.css is your default CSS path.'
echo 'You can skip everything else'
npx shadcn-ui@latest init
cd ../ || exit
