<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>PaymentMethod Detail</title>
            <link rel="stylesheet" type="text/css" href="/qbe/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>PaymentMethod Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="IdpaymentMethod:"/>
                    <h:outputText value="#{paymentMethod.paymentMethod.idpaymentMethod}" title="IdpaymentMethod" />
                    <h:outputText value="Description:"/>
                    <h:outputText value="#{paymentMethod.paymentMethod.description}" title="Description" />
                    <h:outputText value="InvoicesQuantity:"/>
                    <h:outputText value="#{paymentMethod.paymentMethod.invoicesQuantity}" title="InvoicesQuantity" />

                    <h:outputText value="InsurancePolicyList:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty paymentMethod.paymentMethod.insurancePolicyList}" value="(No Items)"/>
                        <h:dataTable value="#{paymentMethod.paymentMethod.insurancePolicyList}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty paymentMethod.paymentMethod.insurancePolicyList}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="IdinsurancePolicy"/>
                                </f:facet>
                                <h:outputText value="#{item.idinsurancePolicy}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Number"/>
                                </f:facet>
                                <h:outputText value="#{item.number}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Type"/>
                                </f:facet>
                                <h:outputText value="#{item.type}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Customer"/>
                                </f:facet>
                                <h:outputText value="#{item.customer}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="StartDate"/>
                                </f:facet>
                                <h:outputText value="#{item.startDate}">
                                    <f:convertDateTime pattern="MM/dd/yyyy" />
                                </h:outputText>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="EndDate"/>
                                </f:facet>
                                <h:outputText value="#{item.endDate}">
                                    <f:convertDateTime pattern="MM/dd/yyyy" />
                                </h:outputText>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Currency"/>
                                </f:facet>
                                <h:outputText value="#{item.currency}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Agent"/>
                                </f:facet>
                                <h:outputText value="#{item.agent}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Surcharge"/>
                                </f:facet>
                                <h:outputText value="#{item.surcharge}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Tax"/>
                                </f:facet>
                                <h:outputText value="#{item.tax}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="ExchangeRate"/>
                                </f:facet>
                                <h:outputText value="#{item.exchangeRate}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Status"/>
                                </f:facet>
                                <h:outputText value="#{item.status}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="IdpaymentMethod"/>
                                </f:facet>
                                <h:outputText value="#{item.idpaymentMethod}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{insurancePolicy.detailSetup}">
                                    <f:param name="jsfcrud.currentPaymentMethod" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paymentMethod.paymentMethod][paymentMethod.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][insurancePolicy.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="paymentMethod" />
                                    <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.PaymentMethodController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{insurancePolicy.editSetup}">
                                    <f:param name="jsfcrud.currentPaymentMethod" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paymentMethod.paymentMethod][paymentMethod.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][insurancePolicy.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="paymentMethod" />
                                    <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.PaymentMethodController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{insurancePolicy.destroy}">
                                    <f:param name="jsfcrud.currentPaymentMethod" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paymentMethod.paymentMethod][paymentMethod.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][insurancePolicy.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="paymentMethod" />
                                    <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.PaymentMethodController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{paymentMethod.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentPaymentMethod" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paymentMethod.paymentMethod][paymentMethod.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{paymentMethod.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentPaymentMethod" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][paymentMethod.paymentMethod][paymentMethod.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{paymentMethod.createSetup}" value="New PaymentMethod" />
                <br />
                <h:commandLink action="#{paymentMethod.listSetup}" value="Show All PaymentMethod Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
