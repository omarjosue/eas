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
import mx.com.qbe.eas.model.Coverage;

/**
 *
 * @author omarjosue
 */
public class CoverageController {

    public CoverageController() {
        pagingInfo = new PagingInfo();
        converter = new CoverageConverter();
    }
    private Coverage coverage = null;
    private List<Coverage> coverageItems = null;
    private CoverageConverter converter = null;
    private PagingInfo pagingInfo = null;

    public PagingInfo getPagingInfo() {

        if (pagingInfo.getItemCount() == -1) {
            String count = "";
            try {
                RestClient client = new RestClient("coverage");
                count = client.countREST();
                client.close();
            } catch (Exception e) {
                JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            }
            pagingInfo.setItemCount(Integer.parseInt(count));
        }
        return pagingInfo;
    }

    private List<Coverage> findAll() {
        List<Coverage> l = null;
        try {
            RestClient client = new RestClient("coverage");
            l = (List<Coverage>) client.findAll_JSON(Coverage.class);
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

    public Coverage getCoverage() {
        if (coverage == null) {
            coverage = (Coverage) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentCoverage", converter, null);
        }
        if (coverage == null) {
            coverage = new Coverage();
        }
        return coverage;
    }

    public String listSetup() {
        reset(true);
        return "coverage_list";
    }

    public String createSetup() {
        reset(false);
        coverage = new Coverage();
        return "coverage_create";
    }

    public String create() {

        try {
            RestClient client = new RestClient("coverage");
            client.create_JSON(coverage);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }
        JsfUtil.addSuccessMessage("Coverage was successfully created.");

        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("coverage_detail");
    }

    public String editSetup() {
        return scalarSetup("coverage_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        coverage = (Coverage) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentCoverage", converter, null);
        if (coverage == null) {
            String requestCoverageString = JsfUtil.getRequestParameter("jsfcrud.currentCoverage");
            JsfUtil.addErrorMessage("The coverage with id " + requestCoverageString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String coverageString = converter.getAsString(FacesContext.getCurrentInstance(), null, coverage);
        String currentCoverageString = JsfUtil.getRequestParameter("jsfcrud.currentCoverage");
        if (coverageString == null || coverageString.length() == 0 || !coverageString.equals(currentCoverageString)) {
            String outcome = editSetup();
            if ("coverage_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit coverage. Try again.");
            }
            return outcome;
        }

        try {
            RestClient client = new RestClient("coverage");
            client.edit_JSON(coverage, coverageString);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }
        JsfUtil.addSuccessMessage("Coverage was successfully edited.");

        return detailSetup();
    }

    public String remove() {
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentCoverage");
        try {
            RestClient client = new RestClient("coverage");
            client.remove(idAsString);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }
        JsfUtil.addSuccessMessage("Coverage was successfully deleted.");

        return relatedOrListOutcome();
    }

    private String relatedOrListOutcome() {
        String relatedControllerOutcome = relatedControllerOutcome();
        //if ((ERROR)) {
        //    return relatedControllerOutcome;
        //}
        return listSetup();
    }

    public Coverage find(String id) {
        Coverage c = null;
        try {
            RestClient client = new RestClient("coverage");
            c = client.find_JSON(Coverage.class, id);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }

        return c;
    }

    public List<Coverage> getCoverageItems() {
        if (coverageItems == null) {
            getPagingInfo();
            try {
                RestClient client = new RestClient("coverage");
                coverageItems = (List<Coverage>) client.findRange_JSON(Coverage.class, String.valueOf(pagingInfo.getFirstItem()), String.valueOf(pagingInfo.getFirstItem() + pagingInfo.getBatchSize()));
                client.close();
            } catch (Exception e) {
                JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            }
        }
        return coverageItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "coverage_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "coverage_list";
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
        coverage = null;
        coverageItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Coverage newCoverage = new Coverage();
        String newCoverageString = converter.getAsString(FacesContext.getCurrentInstance(), null, newCoverage);
        String coverageString = converter.getAsString(FacesContext.getCurrentInstance(), null, coverage);
        if (!newCoverageString.equals(coverageString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }

}
