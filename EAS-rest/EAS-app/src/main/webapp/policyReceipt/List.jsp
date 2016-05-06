<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing PolicyReceipt Items</title>
            <link rel="stylesheet" type="text/css" href="/qbe/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing PolicyReceipt Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No PolicyReceipt Items Found)<br />" rendered="#{policyReceipt.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{policyReceipt.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{policyReceipt.pagingInfo.firstItem + 1}..#{policyReceipt.pagingInfo.lastItem} of #{policyReceipt.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{policyReceipt.prev}" value="Previous #{policyReceipt.pagingInfo.batchSize}" rendered="#{policyReceipt.pagingInfo.firstItem >= policyReceipt.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{policyReceipt.next}" value="Next #{policyReceipt.pagingInfo.batchSize}" rendered="#{policyReceipt.pagingInfo.lastItem + policyReceipt.pagingInfo.batchSize <= policyReceipt.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{policyReceipt.next}" value="Remaining #{policyReceipt.pagingInfo.itemCount - policyReceipt.pagingInfo.lastItem}"
                                   rendered="#{policyReceipt.pagingInfo.lastItem < policyReceipt.pagingInfo.itemCount && policyReceipt.pagingInfo.lastItem + policyReceipt.pagingInfo.batchSize > policyReceipt.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{policyReceipt.policyReceiptItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Folio"/>
                            </f:facet>
                            <h:outputText value="#{item.folio}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="CurrentReceipt"/>
                            </f:facet>
                            <h:outputText value="#{item.currentReceipt}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Type"/>
                            </f:facet>
                            <h:outputText value="#{item.type}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="SurchargeTotal"/>
                            </f:facet>
                            <h:outputText value="#{item.surchargeTotal}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="TaxTotal"/>
                            </f:facet>
                            <h:outputText value="#{item.taxTotal}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="PrimeTotal"/>
                            </f:facet>
                            <h:outputText value="#{item.primeTotal}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="DueDate"/>
                            </f:facet>
                            <h:outputText value="#{item.dueDate}">
                                <f:convertDateTime pattern="MM/dd/yyyy" />
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="IdinsurancePolicy"/>
                            </f:facet>
                            <h:outputText value="#{item.idinsurancePolicy}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{policyReceipt.detailSetup}">
                                <f:param name="jsfcrud.currentPolicyReceipt" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][policyReceipt.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{policyReceipt.editSetup}">
                                <f:param name="jsfcrud.currentPolicyReceipt" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][policyReceipt.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{policyReceipt.remove}">
                                <f:param name="jsfcrud.currentPolicyReceipt" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][policyReceipt.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{policyReceipt.createSetup}" value="New PolicyReceipt"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
