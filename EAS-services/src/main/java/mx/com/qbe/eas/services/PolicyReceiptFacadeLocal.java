/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.qbe.eas.services;

import java.util.List;
import javax.ejb.Local;
import mx.com.qbe.eas.model.PolicyReceipt;

/**
 *
 * @author omarjosue
 */
@Local
public interface PolicyReceiptFacadeLocal {

    void create(PolicyReceipt coverage);

    void edit(PolicyReceipt coverage);

    void remove(PolicyReceipt coverage);

    PolicyReceipt find(Object id);

    List<PolicyReceipt> findAll();

    List<PolicyReceipt> findRange(int[] range);

    int count();
    
}
