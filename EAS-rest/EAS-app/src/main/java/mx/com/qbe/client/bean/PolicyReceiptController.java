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
import mx.com.qbe.eas.model.PolicyReceipt;

/**
 *
 * @author omarjosue
 */
public class PolicyReceiptController {

    public PolicyReceiptController() {
        pagingInfo = new PagingInfo();
        converter = new PolicyReceiptConverter();
    }
    private PolicyReceipt policyReceipt = null;
    private List<PolicyReceipt> policyReceiptItems = null;
    private PolicyReceiptConverter converter = null;
    private PagingInfo pagingInfo = null;

    public PagingInfo getPagingInfo() {

        if (pagingInfo.getItemCount() == -1) {
            String count = "";
            try {
                RestClient client = new RestClient("policyreceipt");
                count = client.countREST();
                client.close();
            } catch (Exception e) {
                JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            }
            pagingInfo.setItemCount(Integer.parseInt(count));
        }
        return pagingInfo;
    }

    private List<PolicyReceipt> findAll() {
        List<PolicyReceipt> l = null;
        try {
            RestClient client = new RestClient("policyreceipt");
            l = (List<PolicyReceipt>) client.findAll_JSON(PolicyReceipt.class);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }

        return l;
    }

    public SelectItem[] getPolicyReceiptItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(findAll(), false);
    }

    public SelectItem[] getPolicyReceiptItemsAvailableSelectOne() {

        return JsfUtil.getSelectItems(findAll(), true);
    }

    public PolicyReceipt getPolicyReceipt() {
        if (policyReceipt == null) {
            policyReceipt = (PolicyReceipt) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPolicyReceipt", converter, null);
        }
        if (policyReceipt == null) {
            policyReceipt = new PolicyReceipt();
        }
        return policyReceipt;
    }

    public String listSetup() {
        reset(true);
        return "policyReceipt_list";
    }

    public String createSetup() {
        reset(false);
        policyReceipt = new PolicyReceipt();
        return "policyReceipt_create";
    }

    public String create() {

        try {
            RestClient client = new RestClient("policyreceipt");
            client.create_JSON(policyReceipt);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }
        JsfUtil.addSuccessMessage("PolicyReceipt was successfully created.");

        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("policyReceipt_detail");
    }

    public String editSetup() {
        return scalarSetup("policyReceipt_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        policyReceipt = (PolicyReceipt) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPolicyReceipt", converter, null);
        if (policyReceipt == null) {
            String requestPolicyReceiptString = JsfUtil.getRequestParameter("jsfcrud.currentPolicyReceipt");
            JsfUtil.addErrorMessage("The policyReceipt with id " + requestPolicyReceiptString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String policyReceiptString = converter.getAsString(FacesContext.getCurrentInstance(), null, policyReceipt);
        String currentPolicyReceiptString = JsfUtil.getRequestParameter("jsfcrud.currentPolicyReceipt");
        if (policyReceiptString == null || policyReceiptString.length() == 0 || !policyReceiptString.equals(currentPolicyReceiptString)) {
            String outcome = editSetup();
            if ("policyReceipt_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit policyReceipt. Try again.");
            }
            return outcome;
        }

        try {
            RestClient client = new RestClient("policyreceipt");
            client.edit_JSON(policyReceipt, policyReceiptString);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }
        JsfUtil.addSuccessMessage("PolicyReceipt was successfully edited.");

        return detailSetup();
    }

    public String remove() {
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentPolicyReceipt");
        try {
            RestClient client = new RestClient("policyreceipt");
            client.remove(idAsString);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }
        JsfUtil.addSuccessMessage("PolicyReceipt was successfully deleted.");

        return relatedOrListOutcome();
    }

    private String relatedOrListOutcome() {
        String relatedControllerOutcome = relatedControllerOutcome();
        //if ((ERROR)) {
        //    return relatedControllerOutcome;
        //}
        return listSetup();
    }

    public PolicyReceipt find(String id) {
        PolicyReceipt p = null;
        try {
            RestClient client = new RestClient("policyreceipt");
            p = client.find_JSON(PolicyReceipt.class, id);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }

        return p;
    }

    public List<PolicyReceipt> getPolicyReceiptItems() {
        if (policyReceiptItems == null) {
            getPagingInfo();
            try {
                RestClient client = new RestClient("policyreceipt");
                policyReceiptItems = (List<PolicyReceipt>) client.findRange_JSON(PolicyReceipt.class, String.valueOf(pagingInfo.getFirstItem()), String.valueOf(pagingInfo.getFirstItem() + pagingInfo.getBatchSize()));
                client.close();
            } catch (Exception e) {
                JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            }
        }
        return policyReceiptItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "policyReceipt_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "policyReceipt_list";
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
        policyReceipt = null;
        policyReceiptItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        PolicyReceipt newPolicyReceipt = new PolicyReceipt();
        String newPolicyReceiptString = converter.getAsString(FacesContext.getCurrentInstance(), null, newPolicyReceipt);
        String policyReceiptString = converter.getAsString(FacesContext.getCurrentInstance(), null, policyReceipt);
        if (!newPolicyReceiptString.equals(policyReceiptString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }

}
