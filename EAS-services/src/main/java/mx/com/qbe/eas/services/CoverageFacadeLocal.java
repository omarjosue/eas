/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.qbe.eas.services;

import java.util.List;
import javax.ejb.Local;
import mx.com.qbe.eas.model.Coverage;

/**
 *
 * @author omarjosue
 */
@Local
public interface CoverageFacadeLocal {

    void create(Coverage coverage);

    void edit(Coverage coverage);

    void remove(Coverage coverage);

    Coverage find(Object id);

    List<Coverage> findAll();

    List<Coverage> findRange(int[] range);

    int count();
    
}
