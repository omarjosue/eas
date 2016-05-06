<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing InsurancePolicy Items</title>
            <link rel="stylesheet" type="text/css" href="/qbe/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing InsurancePolicy Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No InsurancePolicy Items Found)<br />" rendered="#{insurancePolicy.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{insurancePolicy.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{insurancePolicy.pagingInfo.firstItem + 1}..#{insurancePolicy.pagingInfo.lastItem} of #{insurancePolicy.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{insurancePolicy.prev}" value="Previous #{insurancePolicy.pagingInfo.batchSize}" rendered="#{insurancePolicy.pagingInfo.firstItem >= insurancePolicy.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{insurancePolicy.next}" value="Next #{insurancePolicy.pagingInfo.batchSize}" rendered="#{insurancePolicy.pagingInfo.lastItem + insurancePolicy.pagingInfo.batchSize <= insurancePolicy.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{insurancePolicy.next}" value="Remaining #{insurancePolicy.pagingInfo.itemCount - insurancePolicy.pagingInfo.lastItem}"
                                   rendered="#{insurancePolicy.pagingInfo.lastItem < insurancePolicy.pagingInfo.itemCount && insurancePolicy.pagingInfo.lastItem + insurancePolicy.pagingInfo.batchSize > insurancePolicy.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{insurancePolicy.insurancePolicyItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
                                <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][insurancePolicy.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{insurancePolicy.editSetup}">
                                <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][insurancePolicy.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{insurancePolicy.remove}">
                                <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][insurancePolicy.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{insurancePolicy.createSetup}" value="New InsurancePolicy"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
