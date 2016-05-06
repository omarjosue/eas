/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.qbe.client.bean;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import mx.com.qbe.eas.model.PolicyReceipt;

/**
 *
 * @author omarjosue
 */
public class PolicyReceiptConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        PolicyReceiptController controller = (PolicyReceiptController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "policyReceipt");
        
        return controller.find(string);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof PolicyReceipt) {
            PolicyReceipt o = (PolicyReceipt) object;
            return o.getFolio() == null ? "" : o.getFolio().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: mx.com.qbe.eas.model.PolicyReceipt");
        }
    }
    
}
