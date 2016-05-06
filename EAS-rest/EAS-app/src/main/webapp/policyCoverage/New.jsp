<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New PolicyCoverage</title>
            <link rel="stylesheet" type="text/css" href="/qbe/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New PolicyCoverage</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{policyCoverage.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="IdpolicyCoverage:"/>
                    <h:inputText id="idpolicyCoverage" value="#{policyCoverage.policyCoverage.idpolicyCoverage}" title="IdpolicyCoverage" required="true" requiredMessage="The idpolicyCoverage field is required." />
                    <h:outputText value="SumAssured:"/>
                    <h:inputText id="sumAssured" value="#{policyCoverage.policyCoverage.sumAssured}" title="SumAssured" required="true" requiredMessage="The sumAssured field is required." />
                    <h:outputText value="Prime:"/>
                    <h:inputText id="prime" value="#{policyCoverage.policyCoverage.prime}" title="Prime" required="true" requiredMessage="The prime field is required." />
                    <h:outputText value="Comission:"/>
                    <h:inputText id="comission" value="#{policyCoverage.policyCoverage.comission}" title="Comission" required="true" requiredMessage="The comission field is required." />
                    <h:outputText value="IdinsurancePolicy:"/>
                    <h:selectOneMenu id="idinsurancePolicy" value="#{policyCoverage.policyCoverage.idinsurancePolicy}" title="IdinsurancePolicy" required="true" requiredMessage="The idinsurancePolicy field is required." >
                        <f:selectItems value="#{insurancePolicy.insurancePolicyItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="Idcoverage:"/>
                    <h:selectOneMenu id="idcoverage" value="#{policyCoverage.policyCoverage.idcoverage}" title="Idcoverage" required="true" requiredMessage="The idcoverage field is required." >
                        <f:selectItems value="#{coverage.coverageItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{policyCoverage.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{policyCoverage.listSetup}" value="Show All PolicyCoverage Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
