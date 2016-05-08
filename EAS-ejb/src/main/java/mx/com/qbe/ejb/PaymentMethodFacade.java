/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.qbe.ejb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import mx.com.qbe.eas.model.PaymentMethod;
import mx.com.qbe.eas.services.PaymentMethodFacadeLocal;

/**
 *
 * @author omarjosue
 */
@Stateless (name="PaymentMethodFacade")
public class PaymentMethodFacade extends AbstractFacade<PaymentMethod> implements PaymentMethodFacadeLocal {

    @PersistenceContext(unitName = "mx.com.qbe_EAS-ejb_ejb_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PaymentMethodFacade() {
        super(PaymentMethod.class);
    }
    
}
