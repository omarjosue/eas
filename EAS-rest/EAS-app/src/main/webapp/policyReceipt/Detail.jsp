<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>PolicyReceipt Detail</title>
            <link rel="stylesheet" type="text/css" href="/qbe/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>PolicyReceipt Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Folio:"/>
                    <h:outputText value="#{policyReceipt.policyReceipt.folio}" title="Folio" />
                    <h:outputText value="CurrentReceipt:"/>
                    <h:outputText value="#{policyReceipt.policyReceipt.currentReceipt}" title="CurrentReceipt" />
                    <h:outputText value="Type:"/>
                    <h:outputText value="#{policyReceipt.policyReceipt.type}" title="Type" />
                    <h:outputText value="SurchargeTotal:"/>
                    <h:outputText value="#{policyReceipt.policyReceipt.surchargeTotal}" title="SurchargeTotal" />
                    <h:outputText value="TaxTotal:"/>
                    <h:outputText value="#{policyReceipt.policyReceipt.taxTotal}" title="TaxTotal" />
                    <h:outputText value="PrimeTotal:"/>
                    <h:outputText value="#{policyReceipt.policyReceipt.primeTotal}" title="PrimeTotal" />
                    <h:outputText value="DueDate:"/>
                    <h:outputText value="#{policyReceipt.policyReceipt.dueDate}" title="DueDate" >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:outputText>
                    <h:outputText value="IdinsurancePolicy:"/>
                    <h:panelGroup>
                        <h:outputText value="#{policyReceipt.policyReceipt.idinsurancePolicy}"/>
                        <h:panelGroup rendered="#{policyReceipt.policyReceipt.idinsurancePolicy != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{insurancePolicy.detailSetup}">
                                <f:param name="jsfcrud.currentPolicyReceipt" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyReceipt.policyReceipt][policyReceipt.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyReceipt.policyReceipt.idinsurancePolicy][insurancePolicy.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="policyReceipt"/>
                                <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.PolicyReceiptController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{insurancePolicy.editSetup}">
                                <f:param name="jsfcrud.currentPolicyReceipt" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyReceipt.policyReceipt][policyReceipt.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyReceipt.policyReceipt.idinsurancePolicy][insurancePolicy.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="policyReceipt"/>
                                <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.PolicyReceiptController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{insurancePolicy.destroy}">
                                <f:param name="jsfcrud.currentPolicyReceipt" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyReceipt.policyReceipt][policyReceipt.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyReceipt.policyReceipt.idinsurancePolicy][insurancePolicy.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="policyReceipt"/>
                                <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.PolicyReceiptController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>


                </h:panelGrid>
                <br />
                <h:commandLink action="#{policyReceipt.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentPolicyReceipt" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyReceipt.policyReceipt][policyReceipt.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{policyReceipt.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentPolicyReceipt" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyReceipt.policyReceipt][policyReceipt.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{policyReceipt.createSetup}" value="New PolicyReceipt" />
                <br />
                <h:commandLink action="#{policyReceipt.listSetup}" value="Show All PolicyReceipt Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
