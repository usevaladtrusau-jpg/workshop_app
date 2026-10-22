// @ts-check
import eslint from "@eslint/js";
import nodePlugin from "eslint-plugin-n";
import eslintPluginPrettierRecommended from "eslint-plugin-prettier/recommended";
import { defineConfig } from "eslint/config";
import globals from "globals";
import tseslint from "typescript-eslint";
import importPluginX from "eslint-plugin-import-x";

export default defineConfig(
  {
    ignores: ["eslint.config.mjs"],
  },
  eslint.configs.recommended,
  ...tseslint.configs.recommendedTypeChecked,
  eslintPluginPrettierRecommended,
  {
    plugins: {
      js: eslint,
      import: importPluginX,
       n: nodePlugin,
    },
    rules: {
      "import/order": [
        "error",
        {
          "newlines-between": "always",
          groups: [
            ["builtin", "external"],
            "internal",
            "parent",
            "sibling",
            "index",
          ],
          pathGroups: [{ pattern: "./src/**", group: "internal" }],
          alphabetize: { order: "asc" },
        },
      ],
    },
  },
  {
    files: ["**/*.ts"],
    languageOptions: {
      globals: {
        ...globals.node,
        ...globals.jest,
      },
      parser: tseslint.parser,
      sourceType: "module",
      parserOptions: {
        projectService: true,
        tsconfigRootDir: import.meta.dirname,
      },
    },
  },
  {
    rules: {
      "@typescript-eslint/no-floating-promises": "warn",

      "prettier/prettier": [
        "error",
        {},
        {
          usePrettierrc: true,
        },
      ],
      "@typescript-eslint/no-unsafe-argument": "warn",
      "@typescript-eslint/no-unsafe-member-access": "warn",
      "@typescript-eslint/no-unsafe-call": "warn",
      "@typescript-eslint/no-unsafe-assignment": "warn",
      "@typescript-eslint/no-unnecessary-type-assertion": "warn",

      "@typescript-eslint/explicit-function-return-type": "off",
      "@typescript-eslint/explicit-module-boundary-types": "off",
      "@typescript-eslint/no-explicit-any": "off",

      semi: ["error", "always"],

      "eol-last": ["error", "always"],

      "no-unused-expressions": "error",

      "no-var": "error",

      "no-eval": "error",

      "no-fallthrough": "error",

      "no-implicit-globals": "off",

      "no-new-func": "error",

      "no-new-wrappers": "error",

      "no-self-assign": [
        "error",
        {
          props: true,
        },
      ],

      "no-self-compare": "error",

      "no-sequences": "error",

      "no-throw-literal": "error",

      "no-unmodified-loop-condition": "off",

      "no-useless-catch": "error",

      "no-useless-concat": "error",

      "no-useless-escape": "error",

      "no-useless-return": "error",

      "no-void": "error",

      yoda: "error",

      "n/no-deprecated-api": "error",

      "n/no-process-env": "off",

      "n/no-process-exit": "off",

      "for-direction": "error",

      "no-console": "error",

      "no-empty": "error",

      "no-extra-boolean-cast": "error",

      "no-unreachable": "error",
    },
  },
  {
    files: ["**/*.js"],
    ...tseslint.configs.disableTypeChecked,
  },
  {
    ignores: [
      "eslint.config.mjs",
      "node_modules/**",
      "@cds-models/**",
      "db/data/**",
      "gen/**",
      "dist/**",
      "build/**",
      "coverage/**",
    ],
  },
);
