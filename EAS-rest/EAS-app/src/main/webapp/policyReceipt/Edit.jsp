<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing PolicyReceipt</title>
            <link rel="stylesheet" type="text/css" href="/qbe/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing PolicyReceipt</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Folio:"/>
                    <h:outputText value="#{policyReceipt.policyReceipt.folio}" title="Folio" />
                    <h:outputText value="CurrentReceipt:"/>
                    <h:inputText id="currentReceipt" value="#{policyReceipt.policyReceipt.currentReceipt}" title="CurrentReceipt" required="true" requiredMessage="The currentReceipt field is required." />
                    <h:outputText value="Type:"/>
                    <h:inputText id="type" value="#{policyReceipt.policyReceipt.type}" title="Type" required="true" requiredMessage="The type field is required." />
                    <h:outputText value="SurchargeTotal:"/>
                    <h:inputText id="surchargeTotal" value="#{policyReceipt.policyReceipt.surchargeTotal}" title="SurchargeTotal" required="true" requiredMessage="The surchargeTotal field is required." />
                    <h:outputText value="TaxTotal:"/>
                    <h:inputText id="taxTotal" value="#{policyReceipt.policyReceipt.taxTotal}" title="TaxTotal" required="true" requiredMessage="The taxTotal field is required." />
                    <h:outputText value="PrimeTotal:"/>
                    <h:inputText id="primeTotal" value="#{policyReceipt.policyReceipt.primeTotal}" title="PrimeTotal" required="true" requiredMessage="The primeTotal field is required." />
                    <h:outputText value="DueDate (MM/dd/yyyy):"/>
                    <h:inputText id="dueDate" value="#{policyReceipt.policyReceipt.dueDate}" title="DueDate" required="true" requiredMessage="The dueDate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="IdinsurancePolicy:"/>
                    <h:selectOneMenu id="idinsurancePolicy" value="#{policyReceipt.policyReceipt.idinsurancePolicy}" title="IdinsurancePolicy" required="true" requiredMessage="The idinsurancePolicy field is required." >
                        <f:selectItems value="#{insurancePolicy.insurancePolicyItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{policyReceipt.edit}" value="Save">
                    <f:param name="jsfcrud.currentPolicyReceipt" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyReceipt.policyReceipt][policyReceipt.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{policyReceipt.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentPolicyReceipt" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyReceipt.policyReceipt][policyReceipt.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{policyReceipt.listSetup}" value="Show All PolicyReceipt Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
