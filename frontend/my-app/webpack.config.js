// webpack.config.js
const path = require('path');

module.exports = {
  // ... other config options
  resolve: {
    alias: {
      '@': path.resolve(__dirname, 'src')
    },
  },
};
