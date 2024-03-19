module.exports = {
    root: true,
    // parser: 'babel-eslint',
    parser: "@babel/eslint-parser",
    env: {
        commonjs: true,
        browser: true,
        worker: true,
        jquery: true,
        mocha: true,
        es6: true,
        amd: true,
    },
    extends: [
        "eslint:recommended",
        "plugin:import/recommended",
        "plugin:promise/recommended",
        "plugin:prettier/recommended",
        "standard",
    ],
    plugins: ["import", "promise", "prettier", "standard", "html"],
    parserOptions: {
        sourceType: "module",
        allowImportExportEverywhere: false,
        codeFrame: false,
        ecmaVersion: 8,
        ecmaFeatures: {
            impliedStrict: true,
            jsx: true,
            experimentalObjectRestSpread: true,
            classPrivateMethods: true,
        },
        // babelOptions: { configFile: '.babelrc'},
        requireConfigFile: false, // disable babel config file
    },
    rules: {
        "no-console": [
            "error",
            {
                allow: ["debug", "warn", "error", "info", "assert"],
            },
        ],
        "max-len": ["error", {code: 100, comments: 100, ignoreTrailingComments: true}],
        indent: ["error", 4],
        "linebreak-style": ["error", "unix"],
        camelcase: "off",
        "comma-dangle": ["error", "only-multiline"],
        "object-curly-spacing": ["error", "never"],
        "operator-linebreak": [
            "error",
            "before",
            {
                overrides: {"=": "after"},
            },
        ],
        "comma-style": ["error", "last"], // first or last
        quotes: [
            "error",
            "double",
            {
                avoidEscape: true,
                allowTemplateLiterals: true,
            },
        ],
        semi: ["error", "always"],
        "dot-notation": ["off"],
        "no-var": "error",
        "quote-props": ["error", "as-needed"],
        "space-before-function-paren": [
            "error",
            {
                named: "never",
                anonymous: "never",
                asyncArrow: "always",
            },
        ],
        "max-depth": ["error", 9],
        "max-statements": ["error", 99],
        "no-mixed-operators": [
            "error",
            {
                allowSamePrecedence: true,
                groups: [["&", "|", "^", "~", "<<", ">>", ">>>"]],
            },
        ],
        "prefer-const": ["error", {destructuring: "all"}],
        "prettier/prettier": [
            "error",
            {
                tabWidth: 4,
                printWidth: 100,
                trailingComma: "all",
                semi: true,
                singleQuote: false,
                bracketSpacing: false,
                bracketSameLine: true,
                parser: "babel",
                arrowParens: "avoid",
            },
        ],
    },

    globals: {
        $elem: true,
        assert: true,
        XMLChild: true,
        XMLContent: true,
        XMLChildren: true,
        XMLAttrValue: true,
        XMLAttributes2Dict: true,
        OpenURI: true,
        OpenDialogWindow: true,
        html2escape: true,
        WdatePicker: true,
    },
};
