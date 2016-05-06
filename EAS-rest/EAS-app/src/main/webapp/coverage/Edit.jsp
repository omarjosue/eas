<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Coverage</title>
            <link rel="stylesheet" type="text/css" href="/qbe/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Coverage</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Idcoverage:"/>
                    <h:outputText value="#{coverage.coverage.idcoverage}" title="Idcoverage" />
                    <h:outputText value="Concept:"/>
                    <h:inputText id="concept" value="#{coverage.coverage.concept}" title="Concept" required="true" requiredMessage="The concept field is required." />
                    <h:outputText value="Description:"/>
                    <h:inputText id="description" value="#{coverage.coverage.description}" title="Description" required="true" requiredMessage="The description field is required." />
                    <h:outputText value="PolicyCoverageList:"/>
                    <h:selectManyListbox id="policyCoverageList" value="#{coverage.coverage.jsfcrud_transform[jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method.arrayToList].policyCoverageList}" title="PolicyCoverageList" size="6" converter="#{policyCoverage.converter}" >
                        <f:selectItems value="#{policyCoverage.policyCoverageItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{coverage.edit}" value="Save">
                    <f:param name="jsfcrud.currentCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][coverage.coverage][coverage.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{coverage.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][coverage.coverage][coverage.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{coverage.listSetup}" value="Show All Coverage Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
