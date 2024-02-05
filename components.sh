function create_components {
  mkdir modal notification nav

  cd modal || exit
  touch modal.component.tsx modal.model.tsx
  cd ../ || exit

  cd notification || exit
  touch notification.component.tsx notification.model.tsx
  cd ../ || exit

  cd nav || exit
  touch nav.component.tsx nav.model.tsx
  cd ../../ || exit
}

cd client/src/components || exit
create_components
cd ../../../ || exit