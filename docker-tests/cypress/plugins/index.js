/**
 * @type {Cypress.PluginConfig}
 */
 module.exports = (on, config) => {
    require('@jahia/cypress/dist/plugins/registerPlugins').registerPlugins(on, config)

    config.env.NEXUS_USERNAME = process.env.NEXUS_USERNAME

    return config;
};