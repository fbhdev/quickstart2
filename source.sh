function clean_up {
  cd client/src || exit
  rm App.tsx App.css main.tsx
  touch main.tsx app.component.tsx app.model.tsx
  create_main
  create_model
  create_app
  cd ../../ || exit
}

function create_main {
  echo '
import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
import {App} from "./app.component.tsx";
import {QueryClient, QueryClientProvider} from "react-query";
import {HashRouter as Router} from "react-router-dom";

const queryClient = new QueryClient();

ReactDOM.createRoot(document.getElementById("root") as HTMLDivElement).render(
  <React.StrictMode>
    <QueryClientProvider client={queryClient}>
      <Router>
        <App/>
      </Router>
    </QueryClientProvider>
  </React.StrictMode>
);'>>main.tsx
}

function create_model {
  echo "
const enum Common {
  PARENT = 'h-screen w-screen max-w-screen max-h-screen bg-slate-200 text-slate-950 flex items-center justify-center gap-3 text-3xl'
}

export const enum Mobile {
  PARENT = \`\${Common.PARENT}\`
}

export const enum Desktop {
  PARENT = \`\${Common.PARENT}\`
}">>app.model.tsx
}

function create_app {
  echo '
import {Mobile, Desktop} from "./app.model.tsx";
import useMobile from "./hooks/useMobile.ts";
import { MobileContext } from "./context/mobile/mobile.context.tsx";
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faCheck} from "@fortawesome/free-solid-svg-icons";

export const App = function (props: any) {

  const mobile = useMobile();

  return (
    <MobileContext.Provider value={{mobile}}>
      <div className={mobile ? Mobile.PARENT : Desktop.PARENT}>
        <span>Success</span>
        <FontAwesomeIcon icon={faCheck}/>
      </div>
    </MobileContext.Provider>
  );
}
'>>app.component.tsx
}

function create_parents {
  cd client/src || exit
  mkdir utils context hooks styles
  cd ../../ || exit
}

clean_up
create_parents
pwd
bash components.sh
bash hooks.sh
bash context.sh
bash client-utils.sh