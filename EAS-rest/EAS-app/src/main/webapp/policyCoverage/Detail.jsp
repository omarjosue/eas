<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>PolicyCoverage Detail</title>
            <link rel="stylesheet" type="text/css" href="/qbe/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>PolicyCoverage Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="IdpolicyCoverage:"/>
                    <h:outputText value="#{policyCoverage.policyCoverage.idpolicyCoverage}" title="IdpolicyCoverage" />
                    <h:outputText value="SumAssured:"/>
                    <h:outputText value="#{policyCoverage.policyCoverage.sumAssured}" title="SumAssured" />
                    <h:outputText value="Prime:"/>
                    <h:outputText value="#{policyCoverage.policyCoverage.prime}" title="Prime" />
                    <h:outputText value="Comission:"/>
                    <h:outputText value="#{policyCoverage.policyCoverage.comission}" title="Comission" />
                    <h:outputText value="IdinsurancePolicy:"/>
                    <h:panelGroup>
                        <h:outputText value="#{policyCoverage.policyCoverage.idinsurancePolicy}"/>
                        <h:panelGroup rendered="#{policyCoverage.policyCoverage.idinsurancePolicy != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{insurancePolicy.detailSetup}">
                                <f:param name="jsfcrud.currentPolicyCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyCoverage.policyCoverage][policyCoverage.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyCoverage.policyCoverage.idinsurancePolicy][insurancePolicy.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="policyCoverage"/>
                                <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.PolicyCoverageController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{insurancePolicy.editSetup}">
                                <f:param name="jsfcrud.currentPolicyCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyCoverage.policyCoverage][policyCoverage.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyCoverage.policyCoverage.idinsurancePolicy][insurancePolicy.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="policyCoverage"/>
                                <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.PolicyCoverageController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{insurancePolicy.destroy}">
                                <f:param name="jsfcrud.currentPolicyCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyCoverage.policyCoverage][policyCoverage.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyCoverage.policyCoverage.idinsurancePolicy][insurancePolicy.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="policyCoverage"/>
                                <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.PolicyCoverageController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>
                    <h:outputText value="Idcoverage:"/>
                    <h:panelGroup>
                        <h:outputText value="#{policyCoverage.policyCoverage.idcoverage}"/>
                        <h:panelGroup rendered="#{policyCoverage.policyCoverage.idcoverage != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{coverage.detailSetup}">
                                <f:param name="jsfcrud.currentPolicyCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyCoverage.policyCoverage][policyCoverage.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyCoverage.policyCoverage.idcoverage][coverage.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="policyCoverage"/>
                                <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.PolicyCoverageController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{coverage.editSetup}">
                                <f:param name="jsfcrud.currentPolicyCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyCoverage.policyCoverage][policyCoverage.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyCoverage.policyCoverage.idcoverage][coverage.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="policyCoverage"/>
                                <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.PolicyCoverageController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{coverage.destroy}">
                                <f:param name="jsfcrud.currentPolicyCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyCoverage.policyCoverage][policyCoverage.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyCoverage.policyCoverage.idcoverage][coverage.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="policyCoverage"/>
                                <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.PolicyCoverageController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>


                </h:panelGrid>
                <br />
                <h:commandLink action="#{policyCoverage.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentPolicyCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyCoverage.policyCoverage][policyCoverage.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{policyCoverage.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentPolicyCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][policyCoverage.policyCoverage][policyCoverage.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{policyCoverage.createSetup}" value="New PolicyCoverage" />
                <br />
                <h:commandLink action="#{policyCoverage.listSetup}" value="Show All PolicyCoverage Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
