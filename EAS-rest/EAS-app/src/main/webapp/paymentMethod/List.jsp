<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing PaymentMethod Items</title>
            <link rel="stylesheet" type="text/css" href="/qbe/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing PaymentMethod Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No PaymentMethod Items Found)<br />" rendered="#{paymentMethod.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{paymentMethod.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{paymentMethod.pagingInfo.firstItem + 1}..#{paymentMethod.pagingInfo.lastItem} of #{paymentMethod.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{paymentMethod.prev}" value="Previous #{paymentMethod.pagingInfo.batchSize}" rendered="#{paymentMethod.pagingInfo.firstItem >= paymentMethod.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{paymentMethod.next}" value="Next #{paymentMethod.pagingInfo.batchSize}" rendered="#{paymentMethod.pagingInfo.lastItem + paymentMethod.pagingInfo.batchSize <= paymentMethod.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{paymentMethod.next}" value="Remaining #{paymentMethod.pagingInfo.itemCount - paymentMethod.pagingInfo.lastItem}"
                                   rendered="#{paymentMethod.pagingInfo.lastItem < paymentMethod.pagingInfo.itemCount && paymentMethod.pagingInfo.lastItem + paymentMethod.pagingInfo.batchSize > paymentMethod.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{paymentMethod.paymentMethodItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="IdpaymentMethod"/>
                            </f:facet>
                            <h:outputText value="#{item.idpaymentMethod}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Description"/>
                            </f:facet>
                            <h:outputText value="#{item.description}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="InvoicesQuantity"/>
                            </f:facet>
                            <h:outputText value="#{item.invoicesQuantity}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{paymentMethod.detailSetup}">
                                <f:param name="jsfcrud.currentPaymentMethod" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paymentMethod.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{paymentMethod.editSetup}">
                                <f:param name="jsfcrud.currentPaymentMethod" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paymentMethod.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{paymentMethod.remove}">
                                <f:param name="jsfcrud.currentPaymentMethod" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paymentMethod.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{paymentMethod.createSetup}" value="New PaymentMethod"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
