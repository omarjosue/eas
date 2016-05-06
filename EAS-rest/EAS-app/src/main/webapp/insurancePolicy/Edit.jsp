<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing InsurancePolicy</title>
            <link rel="stylesheet" type="text/css" href="/qbe/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing InsurancePolicy</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="IdinsurancePolicy:"/>
                    <h:outputText value="#{insurancePolicy.insurancePolicy.idinsurancePolicy}" title="IdinsurancePolicy" />
                    <h:outputText value="Number:"/>
                    <h:inputText id="number" value="#{insurancePolicy.insurancePolicy.number}" title="Number" required="true" requiredMessage="The number field is required." />
                    <h:outputText value="Type:"/>
                    <h:inputText id="type" value="#{insurancePolicy.insurancePolicy.type}" title="Type" required="true" requiredMessage="The type field is required." />
                    <h:outputText value="Customer:"/>
                    <h:inputText id="customer" value="#{insurancePolicy.insurancePolicy.customer}" title="Customer" required="true" requiredMessage="The customer field is required." />
                    <h:outputText value="StartDate (MM/dd/yyyy):"/>
                    <h:inputText id="startDate" value="#{insurancePolicy.insurancePolicy.startDate}" title="StartDate" required="true" requiredMessage="The startDate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="EndDate (MM/dd/yyyy):"/>
                    <h:inputText id="endDate" value="#{insurancePolicy.insurancePolicy.endDate}" title="EndDate" required="true" requiredMessage="The endDate field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="Currency:"/>
                    <h:inputText id="currency" value="#{insurancePolicy.insurancePolicy.currency}" title="Currency" required="true" requiredMessage="The currency field is required." />
                    <h:outputText value="Agent:"/>
                    <h:inputText id="agent" value="#{insurancePolicy.insurancePolicy.agent}" title="Agent" required="true" requiredMessage="The agent field is required." />
                    <h:outputText value="Surcharge:"/>
                    <h:inputText id="surcharge" value="#{insurancePolicy.insurancePolicy.surcharge}" title="Surcharge" required="true" requiredMessage="The surcharge field is required." />
                    <h:outputText value="Tax:"/>
                    <h:inputText id="tax" value="#{insurancePolicy.insurancePolicy.tax}" title="Tax" required="true" requiredMessage="The tax field is required." />
                    <h:outputText value="ExchangeRate:"/>
                    <h:inputText id="exchangeRate" value="#{insurancePolicy.insurancePolicy.exchangeRate}" title="ExchangeRate" required="true" requiredMessage="The exchangeRate field is required." />
                    <h:outputText value="Status:"/>
                    <h:inputText id="status" value="#{insurancePolicy.insurancePolicy.status}" title="Status" required="true" requiredMessage="The status field is required." />
                    <h:outputText value="PolicyReceiptList:"/>
                    <h:selectManyListbox id="policyReceiptList" value="#{insurancePolicy.insurancePolicy.jsfcrud_transform[jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method.arrayToList].policyReceiptList}" title="PolicyReceiptList" size="6" converter="#{policyReceipt.converter}" >
                        <f:selectItems value="#{policyReceipt.policyReceiptItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="PolicyCoverageList:"/>
                    <h:selectManyListbox id="policyCoverageList" value="#{insurancePolicy.insurancePolicy.jsfcrud_transform[jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method.arrayToList].policyCoverageList}" title="PolicyCoverageList" size="6" converter="#{policyCoverage.converter}" >
                        <f:selectItems value="#{policyCoverage.policyCoverageItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="IdpaymentMethod:"/>
                    <h:selectOneMenu id="idpaymentMethod" value="#{insurancePolicy.insurancePolicy.idpaymentMethod}" title="IdpaymentMethod" required="true" requiredMessage="The idpaymentMethod field is required." >
                        <f:selectItems value="#{paymentMethod.paymentMethodItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{insurancePolicy.edit}" value="Save">
                    <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][insurancePolicy.insurancePolicy][insurancePolicy.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{insurancePolicy.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][insurancePolicy.insurancePolicy][insurancePolicy.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{insurancePolicy.listSetup}" value="Show All InsurancePolicy Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
