<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing PolicyCoverage Items</title>
            <link rel="stylesheet" type="text/css" href="/qbe/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing PolicyCoverage Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No PolicyCoverage Items Found)<br />" rendered="#{policyCoverage.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{policyCoverage.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{policyCoverage.pagingInfo.firstItem + 1}..#{policyCoverage.pagingInfo.lastItem} of #{policyCoverage.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{policyCoverage.prev}" value="Previous #{policyCoverage.pagingInfo.batchSize}" rendered="#{policyCoverage.pagingInfo.firstItem >= policyCoverage.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{policyCoverage.next}" value="Next #{policyCoverage.pagingInfo.batchSize}" rendered="#{policyCoverage.pagingInfo.lastItem + policyCoverage.pagingInfo.batchSize <= policyCoverage.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{policyCoverage.next}" value="Remaining #{policyCoverage.pagingInfo.itemCount - policyCoverage.pagingInfo.lastItem}"
                                   rendered="#{policyCoverage.pagingInfo.lastItem < policyCoverage.pagingInfo.itemCount && policyCoverage.pagingInfo.lastItem + policyCoverage.pagingInfo.batchSize > policyCoverage.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{policyCoverage.policyCoverageItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="IdpolicyCoverage"/>
                            </f:facet>
                            <h:outputText value="#{item.idpolicyCoverage}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="SumAssured"/>
                            </f:facet>
                            <h:outputText value="#{item.sumAssured}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Prime"/>
                            </f:facet>
                            <h:outputText value="#{item.prime}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Comission"/>
                            </f:facet>
                            <h:outputText value="#{item.comission}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="IdinsurancePolicy"/>
                            </f:facet>
                            <h:outputText value="#{item.idinsurancePolicy}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Idcoverage"/>
                            </f:facet>
                            <h:outputText value="#{item.idcoverage}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{policyCoverage.detailSetup}">
                                <f:param name="jsfcrud.currentPolicyCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][policyCoverage.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{policyCoverage.editSetup}">
                                <f:param name="jsfcrud.currentPolicyCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][policyCoverage.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{policyCoverage.remove}">
                                <f:param name="jsfcrud.currentPolicyCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][policyCoverage.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{policyCoverage.createSetup}" value="New PolicyCoverage"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
