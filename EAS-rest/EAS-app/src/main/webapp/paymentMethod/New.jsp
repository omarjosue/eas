<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New PaymentMethod</title>
            <link rel="stylesheet" type="text/css" href="/qbe/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New PaymentMethod</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{paymentMethod.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="Description:"/>
                    <h:inputText id="description" value="#{paymentMethod.paymentMethod.description}" title="Description" required="true" requiredMessage="The description field is required." />
                    <h:outputText value="InvoicesQuantity:"/>
                    <h:inputText id="invoicesQuantity" value="#{paymentMethod.paymentMethod.invoicesQuantity}" title="InvoicesQuantity" required="true" requiredMessage="The invoicesQuantity field is required." />
                    <h:outputText value="InsurancePolicyList:"/>
                    <h:selectManyListbox id="insurancePolicyList" value="#{paymentMethod.paymentMethod.jsfcrud_transform[jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method.arrayToList].insurancePolicyList}" title="InsurancePolicyList" size="6" converter="#{insurancePolicy.converter}" >
                        <f:selectItems value="#{insurancePolicy.insurancePolicyItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{paymentMethod.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{paymentMethod.listSetup}" value="Show All PaymentMethod Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
