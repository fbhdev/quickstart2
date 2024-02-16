function create_components {
  mkdir modal notification nav

  cd modal || exit
  touch modal.component.tsx modal.model.tsx
  cd ../ || exit

  cd notification || exit
  touch notification.component.tsx notification.model.tsx
  create_notification_model
  cd ../ || exit

  cd nav || exit
  touch nav.component.tsx nav.model.tsx
  cd ../../ || exit
}

function create_notification_model {
  echo '
import {IconDefinition} from "@fortawesome/pro-light-svg-icons";

export interface NotificationModel {
  icon?: IconDefinition;
  message: string;
}'>>notification.model.tsx
}

cd client/src/components || exit
create_components
cd ../../../ || exit