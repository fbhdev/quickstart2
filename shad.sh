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
npx shadcn-ui@latest init
npx shadcn-ui@latest add accordion
echo 'Accordion'
npx shadcn-ui@latest add alert
echo 'Alert'
npx shadcn-ui@latest add alert-dialog
echo 'Alert Dialog'
npx shadcn-ui@latest add aspect-ratio
echo 'Aspect Ratio'
npx shadcn-ui@latest add badge
echo 'Badge'
npx shadcn-ui@latest add calendar
echo 'Calendar'
npx shadcn-ui@latest add card
echo 'Card'
npx shadcn-ui@latest add carousel
echo 'Carousel'
npx shadcn-ui@latest add checkbox
echo 'Checkbox'
npx shadcn-ui@latest add collapsible
echo 'Collapsible'
npx shadcn-ui@latest add command
echo 'Command'
npx shadcn-ui@latest add context-menu
echo 'Context Menu'
npx shadcn-ui@latest add drawer
echo 'Drawer'
npx shadcn-ui@latest add dropdown-menu
echo 'Dropdown Menu'
npx shadcn-ui@latest add form
echo 'Form'
npx shadcn-ui@latest add hover-card
echo 'Hover Card'
npx shadcn-ui@latest add input
echo 'Input'
npx shadcn-ui@latest add menubar
echo 'Menubar'
npx shadcn-ui@latest add navigation-menu
echo 'Navigation Menu'
npx shadcn-ui@latest add pagination
echo 'Pagination'
npx shadcn-ui@latest add popover
echo 'Popover'
npx shadcn-ui@latest add progress
echo 'Progress'
npx shadcn-ui@latest add radio-group
echo 'Radio Group'
npx shadcn-ui@latest add resizable
echo 'Resizable'
npx shadcn-ui@latest add scroll-area
echo 'Scroll Area'
npx shadcn-ui@latest add select
echo 'Select'
npx shadcn-ui@latest add separator
echo 'Separator'
npx shadcn-ui@latest add sheet
echo 'Sheet'
npx shadcn-ui@latest add skeleton
echo 'Skeleton'
npx shadcn-ui@latest add slider
echo 'Slider'
npx shadcn-ui@latest add switch
echo 'Switch'
npx shadcn-ui@latest add table
echo 'Table'
npx shadcn-ui@latest add tabs
echo 'Tabs'
npx shadcn-ui@latest add textarea
echo 'Textarea'
npx shadcn-ui@latest add toast
echo 'Toast'
npx shadcn-ui@latest add toggle
echo 'Toggle'
npx shadcn-ui@latest add toggle-group
echo 'Toggle Group'
npx shadcn-ui@latest add tooltip
echo 'Tooltip'
cd ../ || exit
