/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.qbe.client.bean;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import javax.faces.FacesException;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.model.SelectItem;
import mx.com.qbe.client.bean.util.JsfUtil;
import mx.com.qbe.client.bean.util.PagingInfo;
import mx.com.qbe.client.rest.RestClient;
import mx.com.qbe.eas.model.InsurancePolicy;

/**
 *
 * @author omarjosue
 */
public class InsurancePolicyController {

    public InsurancePolicyController() {
        pagingInfo = new PagingInfo();
        converter = new InsurancePolicyConverter();
    }
    private InsurancePolicy insurancePolicy = null;
    private List<InsurancePolicy> insurancePolicyItems = null;
    private InsurancePolicyConverter converter = null;
    private PagingInfo pagingInfo = null;

    public PagingInfo getPagingInfo() {

        if (pagingInfo.getItemCount() == -1) {
            String count = "";
            try {
                RestClient client = new RestClient("insurancepolicy");
                count = client.countREST();
                client.close();
            } catch (Exception e) {
                JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            }
            pagingInfo.setItemCount(Integer.parseInt(count));
        }
        return pagingInfo;
    }

    private List<InsurancePolicy> findAll() {
        List<InsurancePolicy> l = null;
        try {
            RestClient client = new RestClient("insurancepolicy");
            l = (List<InsurancePolicy>) client.findAll_JSON(InsurancePolicy.class);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }

        return l;
    }

    public SelectItem[] getCoverageItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(findAll(), false);
    }

    public SelectItem[] getCoverageItemsAvailableSelectOne() {

        return JsfUtil.getSelectItems(findAll(), true);
    }

    public InsurancePolicy getInsurancePolicy() {
        if (insurancePolicy == null) {
            insurancePolicy = (InsurancePolicy) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentInsurancePolicy", converter, null);
        }
        if (insurancePolicy == null) {
            insurancePolicy = new InsurancePolicy();
        }
        return insurancePolicy;
    }

    public String listSetup() {
        reset(true);
        return "insurancePolicy_list";
    }

    public String createSetup() {
        reset(false);
        insurancePolicy = new InsurancePolicy();
        return "insurancePolicy_create";
    }

    public String create() {

        try {
            RestClient client = new RestClient("insurancepolicy");
            client.create_JSON(insurancePolicy);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }
        JsfUtil.addSuccessMessage("InsurancePolicy was successfully created.");

        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("insurancePolicy_detail");
    }

    public String editSetup() {
        return scalarSetup("insurancePolicy_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        insurancePolicy = (InsurancePolicy) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentInsurancePolicy", converter, null);
        if (insurancePolicy == null) {
            String requestCoverageString = JsfUtil.getRequestParameter("jsfcrud.currentInsurancePolicy");
            JsfUtil.addErrorMessage("The insurancePolicy with id " + requestCoverageString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String insurancePolicyString = converter.getAsString(FacesContext.getCurrentInstance(), null, insurancePolicy);
        String currentCoverageString = JsfUtil.getRequestParameter("jsfcrud.currentInsurancePolicy");
        if (insurancePolicyString == null || insurancePolicyString.length() == 0 || !insurancePolicyString.equals(currentCoverageString)) {
            String outcome = editSetup();
            if ("insurancePolicy_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit insurancePolicy. Try again.");
            }
            return outcome;
        }

        try {
            RestClient client = new RestClient("insurancepolicy");
            client.edit_JSON(insurancePolicy, insurancePolicyString);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }
        JsfUtil.addSuccessMessage("InsurancePolicy was successfully edited.");

        return detailSetup();
    }

    public String remove() {
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentInsurancePolicy");
        try {
            RestClient client = new RestClient("insurancepolicy");
            client.remove(idAsString);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }
        JsfUtil.addSuccessMessage("InsurancePolicy was successfully deleted.");

        return relatedOrListOutcome();
    }

    private String relatedOrListOutcome() {
        String relatedControllerOutcome = relatedControllerOutcome();
        //if ((ERROR)) {
        //    return relatedControllerOutcome;
        //}
        return listSetup();
    }

    public InsurancePolicy find(String id) {
        InsurancePolicy i = null;
        try {
            RestClient client = new RestClient("insurancepolicy");
            i = client.find_JSON(InsurancePolicy.class, id);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }

        return i;
    }

    public List<InsurancePolicy> getCoverageItems() {
        if (insurancePolicyItems == null) {
            getPagingInfo();
            try {
                RestClient client = new RestClient("insurancepolicy");
                insurancePolicyItems = (List<InsurancePolicy>)client.findRange_JSON(InsurancePolicy.class, String.valueOf(pagingInfo.getFirstItem()), String.valueOf(pagingInfo.getFirstItem() + pagingInfo.getBatchSize()));
                client.close();
            } catch (Exception e) {
                JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            }
        }
        return insurancePolicyItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "insurancePolicy_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "insurancePolicy_list";
    }

    private String relatedControllerOutcome() {
        String relatedControllerString = JsfUtil.getRequestParameter("jsfcrud.relatedController");
        String relatedControllerTypeString = JsfUtil.getRequestParameter("jsfcrud.relatedControllerType");
        if (relatedControllerString != null && relatedControllerTypeString != null) {
            FacesContext context = FacesContext.getCurrentInstance();
            Object relatedController = context.getApplication().getELResolver().getValue(context.getELContext(), null, relatedControllerString);
            try {
                Class<?> relatedControllerType = Class.forName(relatedControllerTypeString);
                Method detailSetupMethod = relatedControllerType.getMethod("detailSetup");
                return (String) detailSetupMethod.invoke(relatedController);
            } catch (ClassNotFoundException e) {
                throw new FacesException(e);
            } catch (NoSuchMethodException e) {
                throw new FacesException(e);
            } catch (IllegalAccessException e) {
                throw new FacesException(e);
            } catch (InvocationTargetException e) {
                throw new FacesException(e);
            }
        }
        return null;
    }

    private void reset(boolean resetFirstItem) {
        insurancePolicy = null;
        insurancePolicyItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        InsurancePolicy newInsurancePolicy = new InsurancePolicy();
        String newInsurancePolicyString = converter.getAsString(FacesContext.getCurrentInstance(), null, newInsurancePolicy);
        String insurancePolicyString = converter.getAsString(FacesContext.getCurrentInstance(), null, insurancePolicy);
        if (!newInsurancePolicyString.equals(insurancePolicyString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }

}
