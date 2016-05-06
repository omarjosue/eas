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
import mx.com.qbe.eas.model.InsurancePolicy;

/**
 *
 * @author omarjosue
 */
@Local
public interface InsurancePolicyFacadeLocal {

    void create(InsurancePolicy coverage);

    void edit(InsurancePolicy coverage);

    void remove(InsurancePolicy coverage);

    InsurancePolicy find(Object id);

    List<InsurancePolicy> findAll();

    List<InsurancePolicy> findRange(int[] range);

    int count();
    
}