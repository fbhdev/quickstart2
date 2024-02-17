#!/bin/bash

component=$1

echo "
export interface ${component}Model {}

const enum Common {
  PARENT = \"\"
}

export const enum Mobile {
  PARENT = \`\${Common.PARENT}\`
}

export const enum Desktop {
  PARENT = \`\${Common.PARENT}\`
}"
