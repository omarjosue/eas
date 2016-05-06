<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Coverage Items</title>
            <link rel="stylesheet" type="text/css" href="/qbe/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Coverage Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Coverage Items Found)<br />" rendered="#{coverage.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{coverage.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{coverage.pagingInfo.firstItem + 1}..#{coverage.pagingInfo.lastItem} of #{coverage.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{coverage.prev}" value="Previous #{coverage.pagingInfo.batchSize}" rendered="#{coverage.pagingInfo.firstItem >= coverage.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{coverage.next}" value="Next #{coverage.pagingInfo.batchSize}" rendered="#{coverage.pagingInfo.lastItem + coverage.pagingInfo.batchSize <= coverage.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{coverage.next}" value="Remaining #{coverage.pagingInfo.itemCount - coverage.pagingInfo.lastItem}"
                                   rendered="#{coverage.pagingInfo.lastItem < coverage.pagingInfo.itemCount && coverage.pagingInfo.lastItem + coverage.pagingInfo.batchSize > coverage.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{coverage.coverageItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Idcoverage"/>
                            </f:facet>
                            <h:outputText value="#{item.idcoverage}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Concept"/>
                            </f:facet>
                            <h:outputText value="#{item.concept}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Description"/>
                            </f:facet>
                            <h:outputText value="#{item.description}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{coverage.detailSetup}">
                                <f:param name="jsfcrud.currentCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][coverage.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{coverage.editSetup}">
                                <f:param name="jsfcrud.currentCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][coverage.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{coverage.remove}">
                                <f:param name="jsfcrud.currentCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][coverage.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{coverage.createSetup}" value="New Coverage"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
