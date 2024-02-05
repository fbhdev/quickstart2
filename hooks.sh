function create_hooks {
  touch useNotification.ts useMobile.ts useKeyboard.ts
  use_notification
  use_mobile
  use_keyboard
}

function use_notification {
  echo '
import {useState, useEffect} from "react";
import {IconDefinition} from "@fortawesome/pro-light-svg-icons";

export const useNotification = (delay: number = 3000) => {
  const [notification, setNotification] = useState<any>();

  const showNotification = (message: string, icon?: IconDefinition) => {
    setNotification({message, icon});
    const timeout = setTimeout(() => {
      setNotification(undefined);
    }, delay);
    return () => clearTimeout(timeout);
  };

  useEffect(() => {
    return () => {
      if (notification) {
        setNotification(undefined);
      }
    };
  }, [notification]);

  return {notification, showNotification};
};' >>useNotification.ts
}

function use_mobile {
  echo '
import {useEffect, useState} from "react";

export default function useMobile(): boolean {

  const [mobile, setMobile] = useState<boolean>(window.innerWidth < 1024);

  useEffect(() => {
      function resize(): void {
          setMobile(window.innerWidth < 1024);
      }

      window.addEventListener("resize", resize);
      return () => window.removeEventListener("resize", resize);
  })

  return mobile;
}'>>useMobile.ts
}

function use_keyboard {
echo '
import {useEffect} from "react";

export default function useKeyboard(key: string, action: () => void) {
    useEffect(() => {
        const handler = (e: KeyboardEvent) => {
            if (e.key === key) action();
        }
        window.addEventListener("keydown", handler);
        return () => window.removeEventListener("keydown", handler);
    })
}'>>useKeyboard.ts
}

cd client/src/hooks || exit
create_hooks
cd ../../../ || exit