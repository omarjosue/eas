/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.qbe.eas.services;

import java.util.List;
import javax.ejb.Local;
import mx.com.qbe.eas.model.PaymentMethod;

/**
 *
 * @author omarjosue
 */
@Local
public interface PaymentMethodFacadeLocal {

    void create(PaymentMethod coverage);

    void edit(PaymentMethod coverage);

    void remove(PaymentMethod coverage);

    PaymentMethod find(Object id);

    List<PaymentMethod> findAll();

    List<PaymentMethod> findRange(int[] range);

    int count();
    
}