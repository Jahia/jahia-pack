function login() {
    cy.visit(Cypress.env('JAHIA_URL'), {failOnStatusCode: false});
    cy.get('input[name=username]').type('root');
    cy.get('input[name=password]').type(Cypress.env('JAHIA_PASSWORD'));
    cy.get('button[type=submit]').click();
}

describe('Base tests', () => {
    it('should login', () => {
        login('');
        cy.url().should('include', '/jahia/dashboard')
    })

    it('should see license', () => {
        login('')
        cy.visit('/cms/adminframe/default/en/settings.aboutJahia.html?redirect=false');

        cy.contains('JAHIA\'S OPENCORE DISTRIBUTION');
    })

    it('should have module started', () => {
        login('')
        cy.visit('/cms/adminframe/default/en/settings.manageModules.html?redirect=false');
        cy.get('.dataTables_length .form-control.input-sm').select('100');
        cy.get('.dataTables_info').should('not.be.empty').invoke('text').then(text => {
            const number = parseInt(text.split(" ").slice(-1).pop());
            cy.get('.started-label').should('have.length', number);
        })
    })

    it('should compile jsps', () => {
        login('')
        cy.visit('/modules/tools/precompileServlet?compile_type=non-modules&jsp_precompile=true', {timeout: 600000});
        //cy.visit('/modules/tools/precompileServlet?compile_type=modules&jsp_precompile=true', {timeout: 600000});

        cy.contains('No problems found');
    })
})
