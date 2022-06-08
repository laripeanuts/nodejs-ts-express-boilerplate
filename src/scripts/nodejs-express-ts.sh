
clear

pnpm init

pnpm i -D typescript

pnpm i express ts-node-dev

pnpm i -D @types/node @types/express tsconfig-paths

# ESLINT E PRETTIER
pnpm i -D eslint prettier eslint-config-prettier eslint-plugin-prettier eslint-plugin-simple-import-sort eslint-config-xo eslint-plugin-jest @typescript-eslint/eslint-plugin eslint-plugin-node eslint-plugin-promise @typescript-eslint/parser eslint-plugin-import eslint-plugin-n eslint-import-resolver-typescript eslint-plugin-import-helpers

# JEST
pnpm i -D jest ts-jest @types/jest
#babel-jest babel-loader

# BABEL
pnpm i -D @babel/cli @babel/core @babel/node @babel/preset-env @babel/preset-typescript babel-plugin-module-resolver

./nodejs-init-config.sh

typesync
pnpm i

npx npe scripts.build "babel src --extensions \".js,.ts\" --out-dir dist --copy-files --no-copy-ignored"
npx npe scripts.start "node dist/server.js"
npx npe scripts.dev "ts-node-dev -r tsconfig-paths/register --respawn --transpile-only --ignore-watch node_modules --no-notify src/server.ts"
npx npe scripts.test "jest --watchAll"
npx npe scripts.fix "pnpm run format && pnpm run lint:fix"
npx npe scripts.format "prettier --write **/src/*.{ts,tsx,js,jsx,json,yaml}"
npx npe scripts.lint "eslint src/**/*.{ts,tsx,js,jsx}"
npx npe scripts.lint:fix "pnpm run lint --fix"

pnpm dev
