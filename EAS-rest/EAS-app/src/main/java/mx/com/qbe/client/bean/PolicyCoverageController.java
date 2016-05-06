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
import mx.com.qbe.eas.model.PolicyCoverage;

/**
 *
 * @author omarjosue
 */
public class PolicyCoverageController {

    public PolicyCoverageController() {
        pagingInfo = new PagingInfo();
        converter = new PolicyCoverageConverter();
    }
    private PolicyCoverage policyCoverage = null;
    private List<PolicyCoverage> policyCoverageItems = null;
    private PolicyCoverageConverter converter = null;
    private PagingInfo pagingInfo = null;

    public PagingInfo getPagingInfo() {

        if (pagingInfo.getItemCount() == -1) {
            String count = "";
            try {
                RestClient client = new RestClient("policycoverage");
                count = client.countREST();
                client.close();
            } catch (Exception e) {
                JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            }
            pagingInfo.setItemCount(Integer.parseInt(count));
        }
        return pagingInfo;
    }

    private List<PolicyCoverage> findAll() {
        List<PolicyCoverage> l = null;
        try {
            RestClient client = new RestClient("policycoverage");
            l = (List<PolicyCoverage>) client.findAll_JSON(PolicyCoverage.class);
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

    public PolicyCoverage getCoverage() {
        if (policyCoverage == null) {
            policyCoverage = (PolicyCoverage) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPolicyCoverage", converter, null);
        }
        if (policyCoverage == null) {
            policyCoverage = new PolicyCoverage();
        }
        return policyCoverage;
    }

    public String listSetup() {
        reset(true);
        return "policyCoverage_list";
    }

    public String createSetup() {
        reset(false);
        policyCoverage = new PolicyCoverage();
        return "policyCoverage_create";
    }

    public String create() {

        try {
            RestClient client = new RestClient("policycoverage");
            client.create_JSON(policyCoverage);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }
        JsfUtil.addSuccessMessage("PolicyCoverage was successfully created.");

        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("policyCoverage_detail");
    }

    public String editSetup() {
        return scalarSetup("policyCoverage_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        policyCoverage = (PolicyCoverage) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPolicyCoverage", converter, null);
        if (policyCoverage == null) {
            String requestCoverageString = JsfUtil.getRequestParameter("jsfcrud.currentPolicyCoverage");
            JsfUtil.addErrorMessage("The policyCoverage with id " + requestCoverageString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String policyCoverageString = converter.getAsString(FacesContext.getCurrentInstance(), null, policyCoverage);
        String currentCoverageString = JsfUtil.getRequestParameter("jsfcrud.currentPolicyCoverage");
        if (policyCoverageString == null || policyCoverageString.length() == 0 || !policyCoverageString.equals(currentCoverageString)) {
            String outcome = editSetup();
            if ("policyCoverage_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit policyCoverage. Try again.");
            }
            return outcome;
        }

        try {
            RestClient client = new RestClient("policycoverage");
            client.edit_JSON(policyCoverage, policyCoverageString);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }
        JsfUtil.addSuccessMessage("PolicyCoverage was successfully edited.");

        return detailSetup();
    }

    public String remove() {
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentPolicyCoverage");
        try {
            RestClient client = new RestClient("policycoverage");
            client.remove(idAsString);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }
        JsfUtil.addSuccessMessage("PolicyCoverage was successfully deleted.");

        return relatedOrListOutcome();
    }

    private String relatedOrListOutcome() {
        String relatedControllerOutcome = relatedControllerOutcome();
        //if ((ERROR)) {
        //    return relatedControllerOutcome;
        //}
        return listSetup();
    }

    public PolicyCoverage find(String id) {
        PolicyCoverage p = null;
        try {
            RestClient client = new RestClient("policycoverage");
            p = client.find_JSON(PolicyCoverage.class, id);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }

        return p;
    }

    public List<PolicyCoverage> getCoverageItems() {
        if (policyCoverageItems == null) {
            getPagingInfo();
            try {
                RestClient client = new RestClient("policycoverage");
                policyCoverageItems = (List<PolicyCoverage>) client.findRange_JSON(PolicyCoverage.class, String.valueOf(pagingInfo.getFirstItem()), String.valueOf(pagingInfo.getFirstItem() + pagingInfo.getBatchSize()));
                client.close();
            } catch (Exception e) {
                JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            }
        }
        return policyCoverageItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "policyCoverage_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "policyCoverage_list";
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
        policyCoverage = null;
        policyCoverageItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        PolicyCoverage newPolicyCoverage = new PolicyCoverage();
        String newPolicyCoverageString = converter.getAsString(FacesContext.getCurrentInstance(), null, newPolicyCoverage);
        String policyCoverageString = converter.getAsString(FacesContext.getCurrentInstance(), null, policyCoverage);
        if (!newPolicyCoverageString.equals(policyCoverageString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }

}
