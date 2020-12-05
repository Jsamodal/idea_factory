const { environment } = require('@rails/webpacker')

const wepback = require('webpack')

environment.plugins.append('provide',
new wepback.ProvidePlugin({
    $: 'jquery',
    jquery: 'jquery',
    Popper: ['popper.js', 'default']
})
)
module.exports = environment
