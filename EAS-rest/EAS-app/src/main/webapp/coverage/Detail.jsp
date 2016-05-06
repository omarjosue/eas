<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Coverage Detail</title>
            <link rel="stylesheet" type="text/css" href="/qbe/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Coverage Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Idcoverage:"/>
                    <h:outputText value="#{coverage.coverage.idcoverage}" title="Idcoverage" />
                    <h:outputText value="Concept:"/>
                    <h:outputText value="#{coverage.coverage.concept}" title="Concept" />
                    <h:outputText value="Description:"/>
                    <h:outputText value="#{coverage.coverage.description}" title="Description" />

                    <h:outputText value="PolicyCoverageList:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty coverage.coverage.policyCoverageList}" value="(No Items)"/>
                        <h:dataTable value="#{coverage.coverage.policyCoverageList}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty coverage.coverage.policyCoverageList}">
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
                                    <f:param name="jsfcrud.currentCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][coverage.coverage][coverage.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPolicyCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][policyCoverage.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="coverage" />
                                    <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.CoverageController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{policyCoverage.editSetup}">
                                    <f:param name="jsfcrud.currentCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][coverage.coverage][coverage.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPolicyCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][policyCoverage.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="coverage" />
                                    <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.CoverageController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{policyCoverage.destroy}">
                                    <f:param name="jsfcrud.currentCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][coverage.coverage][coverage.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPolicyCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][policyCoverage.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="coverage" />
                                    <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.CoverageController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{coverage.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][coverage.coverage][coverage.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{coverage.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][coverage.coverage][coverage.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{coverage.createSetup}" value="New Coverage" />
                <br />
                <h:commandLink action="#{coverage.listSetup}" value="Show All Coverage Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
