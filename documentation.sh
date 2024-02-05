function make_documentation() {
  touch documentation.md
  echo '
[Vite](https://vitejs.dev)

[React](https://react.dev)

[TypeScript](https://www.typescriptlang.org)

[ShadCN](https://ui.shadcn.com)

[Tailwind](https://tailwindcss.com/docs)

[Tailwind Colors](https://tailwindcss.com/docs/customizing-colors)

[FontAwesome](https://fontawesome.com)

[Google Fonts](https://fonts.google.com)

[MongoDB](https://www.mongodb.com)

[FastAPI](https://fastapi.tiangolo.com)

'>>documentation.md
}

make_documentation