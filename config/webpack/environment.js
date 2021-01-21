const { environment } = require('@rails/webpacker')
const Webpack = require('webpack')
environment.plugins.prepend(
  'provide',
  new Webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    Popper: 'popper.js/dist/popper'
  })
)
module.exports = environment
