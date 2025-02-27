import eslintPluginYml from 'eslint-plugin-yml';
export default [
  ...eslintPluginYml.configs['flat/recommended'],
  {
    files: ['**/*.yml'],
    rules: {
      "yml/no-empty-mapping-value": "off"
    }
  }
];
