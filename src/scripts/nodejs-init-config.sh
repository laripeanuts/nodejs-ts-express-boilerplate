# INDEX FILE

mkdir src
echo 'import express from "express";

const app = express();

app.get("/", (request, response) => {
  return response.json({ message: "Hello World" });
});

app.listen(3333);

' > src/server.ts

#TYPESCRIPT CONFIG

echo '{
  "compilerOptions": {
    "target": "ES2019",
    "module": "commonjs",
    "lib": ["es6"],
    "allowJs": true,
    "outDir": "./dist",
    "rootDir": "./src",
    "removeComments": true,
    "typeRoots": [
      "./node_modules/@types",
      "./src/@types"
    ],
    "strict": true,
    "esModuleInterop": true,
    "resolveJsonModule": true,
    "experimentalDecorators": true,
    "emitDecoratorMetadata": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "baseUrl": ".",
    "paths": {
      "@controllers/*": ["./src/controllers/*"],
      "@models/*": ["./src/models/*"],
      "@views/*": ["./src/views/*"],
      "@config/*": ["./src/config/*"]
    }
  },
  "include": [
    "src/**/*"
  ]
}' > tsconfig.json

# GIT IGNORE
echo 'node_modules
dist' > .gitignore

#PRETTIER
echo 'node_modules
dist
/*.js' > .prettierignore

echo '{
  "parser": "typescript",
  "singleQuote": false,
  "tabWidth": 2,
  "trailingComma": "all",
  "semi": true,
  "bracketSpacing": true,
  "endOfLine": "lf",
  "printWidth": 80,
  "useTabs": false,
  "htmlWhitespaceSensitivity": "ignore",
  "insertPragma": false,
  "arrowParens": "avoid",
  "requirePragma": false,
  "jsxSingleQuote": false,
  "proseWrap": "always",
  "quoteProps": "as-needed"
}' > .prettierrc

# ESLINT

echo '{
  "env": {
      "browser": true,
      "es2021": true,
      "node": true,
      "jest": true,
      "jest/globals": true
  },
  "ignorePatterns": [
      "**/node_modules/**",
      "**/dist/**",
      "**/build/**",
      "node_modules"
  ],
  "extends": [
    "xo",
    "prettier/@typescript-eslint",
    "plugin:@typescript-eslint/recommended",
    "plugin:prettier/recommended"
  ],
  "parser": "@typescript-eslint/parser",
  "parserOptions": {
      "ecmaVersion": 11,
      "sourceType": "module"
  },
  "plugins": [
      "node",
      "prettier",
      "@typescript-eslint",
      "simple-import-sort",
      "eslint-plugin-import-helpers",
      "jest"
  ],
  "rules": {
      "prettier/prettier": "error",
      "simple-import-sort/exports": "error",
      "simple-import-sort/imports": "error",
      "new-cap": "off",
      "capitalized-comments": "off",
      "no-unused-vars": "warn",
      "no-useless-constructor": "warn",
      "quotes": ["error", "double"]
  }
}' > .eslintrc.json

echo 'node_modules
dist
/*.js' > .eslintignore

# EDITOR CONFIG
echo '
[*]
indent_style = space
indent_size = 2
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true
' > .editorconfig

# JEST

echo '
export default {
  clearMocks: true,
  collectCoverage: true,
  coverageDirectory: "coverage",
  preset: "ts-jest",
  globals: {
    "ts-jest": {
      isolatedModules: true,
    },
  },
};

' > jest.config.ts

echo 'module.exports = {
  presets: [
    [
      "@babel/preset-env",
      {
        targets: {
          node: "current"
        }
      }
    ],
    "@babel/preset-typescript"
  ],
  plugins: [
    ["module-resolver", {
      alias: {
        "@config": "./src/config",
        "@models": "./src/models",
        "@controllers": "./src/controllers",
        "@views": "./src/views"
      }
    }]
  ],
  ignore: [
    "**/*.spec.ts"
  ]
}' > babel.config.js

# README FILE
echo '
# App Node Title

...

## 📜 Description

...

## 🎯 Goals

- [ ] ...


## 🏗️ Installation

```bash
# install dependencies
$ pnpm install
```

#### Running the server

```bash
# development
$ pnpm dev

# build mode
$ pnpm build

```
#### Running the tests

```bash
# run all tests
$ pnpm test

```
#### Others

```bash
# prettier
$ pnpm run format

# eslint
$ pnpm run lint:fix

# eslint & prettier
$ pnpm run fix

```

## 👩🏻‍💻 Stay in touch

- Author - [Larissa Rabelo](https://github.com/laripeanuts)
- Twitter - [@laripeanuts](https://twitter.com/laripeanuts)
' > README.md
