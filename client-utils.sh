function create_utils {
  install_dependencies
  create_requests
  create_animate
  create_cache
  create_keyboard_utils
  mkdir icons
  cd icons || exit
  create_yarnrc
  create_files
  create_constants
  cd ../ || exit
}

function create_requests {
  touch requests.ts
  echo '
export const ENDPOINTS = {}
export const enum QUERY_KEYS {}

const HEADERS = {
  "Content-Type": "application/json",
  "Accept": "application/json",
};

export async function GET(endpoint: string): Promise<any> {
  const response = await fetch(endpoint);
  return await response.json();
}

export async function POST(endpoint: string, data: any): Promise<any> {
  const response = await fetch(endpoint, {
    method: "POST",
    headers: HEADERS,
    body: JSON.stringify(data),
  });
  return await response.json();
}

export async function PUT(endpoint: string, data: any): Promise<any> {
  const response = await fetch(endpoint, {
    method: "PUT",
    headers: HEADERS,
    body: JSON.stringify(data),
  });
  return await response.json();
}

export async function DELETE(endpoint: string): Promise<any> {
  const response = await fetch(endpoint, {
    method: "DELETE",
    headers: HEADERS,
  });
  return await response.json();
}'>>requests.ts
}

function create_animate {
  touch animate.ts
  echo '
export const Initial = {
  OPACITY: {opacity: 0}
}

export const Animate = {
  OPACITY: {opacity: 1}
}

export const Exit = {
  OPACITY: {opacity: 0}
}

export const Transition = {
  SHORT: {duration: 0.125, ease: "easeInOut"},
  DEFAULT: {duration: 0.5, ease: "easeInOut"},
}
'>>animate.ts
}

function create_cache {
  touch cache.ts
  echo "
export class Cache {

  private static readonly loot = {};

  static get keys() {
    return this.loot;
  }

  static getItem(key: string): any {
    if (!key) {
      return null;
    }
    const item = localStorage.getItem(key);
    return item ? JSON.parse(item) : null;
  }

  static setItem(key: string, value: unknown): void {
    if (!key && !value) {
      return;
    }
    localStorage.setItem(key, JSON.stringify(value));
  }

  static removeItem(key: string): void {
    if (!key) {
      return;
    }
    localStorage.removeItem(key)
  }

  static clearCache(): void {
    localStorage.clear();
  }
}" >>cache.ts
}

function create_keyboard_utils {
  touch keyboard.constants.tsx
  echo "
export const enum KEYBOARD {
  ENTER = 'Enter',
  ESCAPE = 'Escape',
  TAB = 'Tab',
  BACKSPACE = 'Backspace',
  SHIFT = 'Shift',
  CONTROL = 'Control',
  ALT = 'Alt',
  SPACE = 'Space',
  ARROWUP = 'ArrowUp',
  ARROWDOWN = 'ArrowDown',
  ARROWLEFT = 'ArrowLeft',
  ARROWRIGHT = 'ArrowRight',
  PAGEUP = 'PageUp',
  PAGEDOWN = 'PageDown',
  HOME = 'Home',
  END = 'End',
  INSERT = 'Insert',
  DELETE = 'Delete',
  NUMLOCK = 'NumLock',
  CAPSLOCK = 'CapsLock',
  SCROLLLOCK = 'ScrollLock',
  PAUSEBREAK = 'PauseBreak',
  F1 = 'F1',
  F2 = 'F2',
  F3 = 'F3',
  F4 = 'F4',
  F5 = 'F5',
  F6 = 'F6',
  F7 = 'F7',
  F8 = 'F8',
  F9 = 'F9',
  F10 = 'F10',
  F11 = 'F11',
  F12 = 'F12',
  META = 'Meta',
  CONTEXTMENU = 'ContextMenu',
  PRINTSCREEN = 'PrintScreen',
  A = 'KeyA',
  B = 'KeyB',
  C = 'KeyC',
  D = 'KeyD',
  E = 'KeyE',
  F = 'KeyF',
  G = 'KeyG',
  H = 'KeyH',
  I = 'KeyI',
  J = 'KeyJ',
  K = 'KeyK',
  L = 'KeyL',
  M = 'KeyM',
  N = 'KeyN',
  O = 'KeyO',
  P = 'KeyP',
  Q = 'KeyQ',
  R = 'KeyR',
  S = 'KeyS',
  T = 'KeyT',
  U = 'KeyU',
  V = 'KeyV',
  W = 'KeyW',
  X = 'KeyX',
  Y = 'KeyY',
  Z = 'KeyZ',
  DIGIT0 = 'Digit0',
  DIGIT1 = 'Digit1',
  DIGIT2 = 'Digit2',
  DIGIT3 = 'Digit3',
  DIGIT4 = 'Digit4',
  DIGIT5 = 'Digit5',
  DIGIT6 = 'Digit6',
  DIGIT7 = 'Digit7',
  DIGIT8 = 'Digit8',
  DIGIT9 = 'Digit9'
}" >>keyboard.constants.ts
}

function create_yarnrc() {
  touch .yarnrc.yml
  echo '
plugins:
  dotenv: { }
npmScopes:
  fortawesome:
    npmAlwaysAuth: true
    npmRegistryServer: 'https://npm.fontawesome.com/'
    npmAuthToken: ''
'>>.yarnrc.yml
}

function install_dependencies() {
  yarn add @fortawesome/fontawesome-svg-core \
    @fortawesome/free-solid-svg-icons \
    @fortawesome/free-brands-svg-icons \
    @fortawesome/free-regular-svg-icons \
    @fortawesome/react-fontawesome

  yarn add @fortawesome/free-brands-svg-icons
  yarn add @fortawesome/pro-solid-svg-icons
  yarn add @fortawesome/pro-regular-svg-icons
  yarn add @fortawesome/pro-light-svg-icons
  yarn add @fortawesome/pro-thin-svg-icons
  yarn add @fortawesome/pro-duotone-svg-icons
  yarn add @fortawesome/sharp-solid-svg-icons
  yarn add @fortawesome/sharp-regular-svg-icons
  yarn add @fortawesome/sharp-light-svg-icons

  npm install --save @fortawesome/fontawesome-pro
  yarn add @fortawesome/fontawesome-pro
}

function create_files {
  touch icons.component.tsx icons.model.tsx icons.constants.tsx
}

function create_constants {
  echo '
import {IconDefinition} from "@fortawesome/pro-light-svg-icons";

export const Icon = {} as Record<string, IconDefinition>;
  '>>icons.constants.tsx
}

cd client/src/utils || exit
create_utils
cd ../../../ || exit