/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.qbe.ejb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import mx.com.qbe.eas.model.PolicyCoverage;
import mx.com.qbe.eas.services.PolicyCoverageFacadeLocal;

/**
 *
 * @author omarjosue
 */
@Stateless (name="PolicyCoverageFacade")
public class PolicyCoverageFacade extends AbstractFacade<PolicyCoverage> implements PolicyCoverageFacadeLocal {

    @PersistenceContext(unitName = "mx.com.qbe_EAS-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PolicyCoverageFacade() {
        super(PolicyCoverage.class);
    }
    
}
