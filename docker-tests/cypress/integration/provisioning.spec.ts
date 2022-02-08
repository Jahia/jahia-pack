/* eslint-disable @typescript-eslint/no-explicit-any */
import gql from 'graphql-tag'

// Note: There is currently no provisioning or graphql method to remove the configuration
// It is therefore not being removed after execution of the suite.

describe('Test provisioning', () => {
    function readConfig(variables) {
        return cy.apollo({
            query: gql`
                query($configPid: String!) {
                    admin {
                        jahia {
                            configuration(pid: $configPid) {
                                flatProperties {
                                    key value
                                }
                            }
                        }
                    }
                }
            `,
            variables,
        })
    }

    it('Validate variable substitution', () => {
        cy.runProvisioningScript({ fileName: 'provisioning.json' })

        readConfig({ configPid: 'org.jahia.test.provisioning', flat: true }).should((response: any) => {
            const nexusUsername = response.data.admin.jahia.configuration.flatProperties.find((c: any) => c.key === 'NEXUS_USERNAME')
            expect(nexusUsername).not.to.be.undefined
            expect(nexusUsername.value).to.equal(Cypress.env('NEXUS_USERNAME'))
        })
    })
})
