function create_contexts {
  mkdir modal notification mobile
  modal_context
  notification_context
  mobile_context
}

function modal_context {
  cd modal || exit
  touch modal.context.tsx
  echo '
import {createContext} from "react";

export interface ModalContextInterface {}
export const MobileContext = createContext<ModalContextInterface>({});
'>>modal.context.tsx
  cd ../ || exit
}

function notification_context {
  cd notification || exit
  touch notification.context.tsx
  echo '
import {createContext} from "react";

export interface NotificationContextInterface {}
export const NotificationContext = createContext<NotificationContextInterface>({});
  '>>notification.context.tsx
  cd ../ || exit
}

function mobile_context {
  cd mobile || exit
  touch mobile.context.tsx
  echo '
import {createContext} from "react";

export interface MobileContextInterface {
  mobile: boolean;
}

export const MobileContext = createContext<MobileContextInterface>({
  mobile: false
});

'>>mobile.context.tsx
  cd ../../ || exit
}

cd client/src/context || exit
create_contexts
cd ../../../ || exit