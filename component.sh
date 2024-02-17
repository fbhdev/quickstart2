#!/bin/bash

component=$1

echo "
import {useContext} from \"react\";
import {MobileContext} from \"@/context/mobile/mobile.context.tsx\";
import {${component}Model, Desktop, Mobile} from \"./${component}.model.tsx\";

export const ${component}Component = function (props: ${component}Model) {

  const {mobile} = useContext(MobileContext);

  return (
    <div className={mobile ? Mobile.PARENT : Desktop.PARENT}>
    </div>
  );
}"
