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
import mx.com.qbe.eas.model.PaymentMethod;

/**
 *
 * @author omarjosue
 */
public class PaymentMethodController {

    public PaymentMethodController() {
        pagingInfo = new PagingInfo();
        converter = new PaymentMethodConverter();
    }
    private PaymentMethod paymentMethod = null;
    private List<PaymentMethod> paymentMethodItems = null;
    private PaymentMethodConverter converter = null;
    private PagingInfo pagingInfo = null;

    public PagingInfo getPagingInfo() {

        if (pagingInfo.getItemCount() == -1) {
            String count = "";
            try {
                RestClient client = new RestClient("paymentMethod");
                count = client.countREST();
                client.close();
            } catch (Exception e) {
                JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            }
            pagingInfo.setItemCount(Integer.parseInt(count));
        }
        return pagingInfo;
    }

    private List<PaymentMethod> findAll() {
        List<PaymentMethod> l = null;
        try {
            RestClient client = new RestClient("paymentMethod");
            l = (List<PaymentMethod>) client.findAll_JSON(PaymentMethod.class);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }

        return l;
    }

    public SelectItem[] getPaymentMethodItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(findAll(), false);
    }

    public SelectItem[] getPaymentMethodItemsAvailableSelectOne() {

        return JsfUtil.getSelectItems(findAll(), true);
    }

    public PaymentMethod getPaymentMethod() {
        if (paymentMethod == null) {
            paymentMethod = (PaymentMethod) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPaymentMethod", converter, null);
        }
        if (paymentMethod == null) {
            paymentMethod = new PaymentMethod();
        }
        return paymentMethod;
    }

    public String listSetup() {
        reset(true);
        return "paymentMethod_list";
    }

    public String createSetup() {
        reset(false);
        paymentMethod = new PaymentMethod();
        return "paymentMethod_create";
    }

    public String create() {

        try {
            RestClient client = new RestClient("paymentMethod");
            client.create_JSON(paymentMethod);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }
        JsfUtil.addSuccessMessage("PaymentMethod was successfully created.");

        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("paymentMethod_detail");
    }

    public String editSetup() {
        return scalarSetup("paymentMethod_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        paymentMethod = (PaymentMethod) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPaymentMethod", converter, null);
        if (paymentMethod == null) {
            String requestPaymentMethodString = JsfUtil.getRequestParameter("jsfcrud.currentPaymentMethod");
            JsfUtil.addErrorMessage("The paymentMethod with id " + requestPaymentMethodString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String paymentMethodString = converter.getAsString(FacesContext.getCurrentInstance(), null, paymentMethod);
        String currentPaymentMethodString = JsfUtil.getRequestParameter("jsfcrud.currentPaymentMethod");
        if (paymentMethodString == null || paymentMethodString.length() == 0 || !paymentMethodString.equals(currentPaymentMethodString)) {
            String outcome = editSetup();
            if ("paymentMethod_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit paymentMethod. Try again.");
            }
            return outcome;
        }

        try {
            RestClient client = new RestClient("paymentMethod");
            client.edit_JSON(paymentMethod, paymentMethodString);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }
        JsfUtil.addSuccessMessage("PaymentMethod was successfully edited.");

        return detailSetup();
    }

    public String remove() {
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentPaymentMethod");
        try {
            RestClient client = new RestClient("paymentMethod");
            client.remove(idAsString);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }
        JsfUtil.addSuccessMessage("PaymentMethod was successfully deleted.");

        return relatedOrListOutcome();
    }

    private String relatedOrListOutcome() {
        String relatedControllerOutcome = relatedControllerOutcome();
        //if ((ERROR)) {
        //    return relatedControllerOutcome;
        //}
        return listSetup();
    }

    public PaymentMethod find(String id) {
        PaymentMethod p = null;
        try {
            RestClient client = new RestClient("paymentMethod");
            p = client.find_JSON(PaymentMethod.class, id);
            client.close();
        } catch (Exception e) {
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
        }

        return p;
    }

    public List<PaymentMethod> getPaymentMethodItems() {
        if (paymentMethodItems == null) {
            getPagingInfo();
            try {
                RestClient client = new RestClient("paymentMethod");
                paymentMethodItems = (List<PaymentMethod>)client.findRange_JSON(PaymentMethod.class, String.valueOf(pagingInfo.getFirstItem()), String.valueOf(pagingInfo.getFirstItem() + pagingInfo.getBatchSize()));
                client.close();
            } catch (Exception e) {
                JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            }
        }
        return paymentMethodItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "paymentMethod_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "paymentMethod_list";
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
        paymentMethod = null;
        paymentMethodItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        PaymentMethod newPaymentMethod = new PaymentMethod();
        String newPaymentMethodString = converter.getAsString(FacesContext.getCurrentInstance(), null, newPaymentMethod);
        String paymentMethodString = converter.getAsString(FacesContext.getCurrentInstance(), null, paymentMethod);
        if (!newPaymentMethodString.equals(paymentMethodString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }

}
