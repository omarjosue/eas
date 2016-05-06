/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.qbe.eas.services;

import java.util.List;
import javax.ejb.Local;
import mx.com.qbe.eas.model.PolicyCoverage;

/**
 *
 * @author omarjosue
 */
@Local
public interface PolicyCoverageFacadeLocal {

    void create(PolicyCoverage coverage);

    void edit(PolicyCoverage coverage);

    void remove(PolicyCoverage coverage);

    PolicyCoverage find(Object id);

    List<PolicyCoverage> findAll();

    List<PolicyCoverage> findRange(int[] range);

    int count();
    
}
