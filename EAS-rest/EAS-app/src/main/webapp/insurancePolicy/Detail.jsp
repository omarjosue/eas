<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>InsurancePolicy Detail</title>
            <link rel="stylesheet" type="text/css" href="/qbe/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>InsurancePolicy Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="IdinsurancePolicy:"/>
                    <h:outputText value="#{insurancePolicy.insurancePolicy.idinsurancePolicy}" title="IdinsurancePolicy" />
                    <h:outputText value="Number:"/>
                    <h:outputText value="#{insurancePolicy.insurancePolicy.number}" title="Number" />
                    <h:outputText value="Type:"/>
                    <h:outputText value="#{insurancePolicy.insurancePolicy.type}" title="Type" />
                    <h:outputText value="Customer:"/>
                    <h:outputText value="#{insurancePolicy.insurancePolicy.customer}" title="Customer" />
                    <h:outputText value="StartDate:"/>
                    <h:outputText value="#{insurancePolicy.insurancePolicy.startDate}" title="StartDate" >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:outputText>
                    <h:outputText value="EndDate:"/>
                    <h:outputText value="#{insurancePolicy.insurancePolicy.endDate}" title="EndDate" >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:outputText>
                    <h:outputText value="Currency:"/>
                    <h:outputText value="#{insurancePolicy.insurancePolicy.currency}" title="Currency" />
                    <h:outputText value="Agent:"/>
                    <h:outputText value="#{insurancePolicy.insurancePolicy.agent}" title="Agent" />
                    <h:outputText value="Surcharge:"/>
                    <h:outputText value="#{insurancePolicy.insurancePolicy.surcharge}" title="Surcharge" />
                    <h:outputText value="Tax:"/>
                    <h:outputText value="#{insurancePolicy.insurancePolicy.tax}" title="Tax" />
                    <h:outputText value="ExchangeRate:"/>
                    <h:outputText value="#{insurancePolicy.insurancePolicy.exchangeRate}" title="ExchangeRate" />
                    <h:outputText value="Status:"/>
                    <h:outputText value="#{insurancePolicy.insurancePolicy.status}" title="Status" />
                    <h:outputText value="IdpaymentMethod:"/>
                    <h:panelGroup>
                        <h:outputText value="#{insurancePolicy.insurancePolicy.idpaymentMethod}"/>
                        <h:panelGroup rendered="#{insurancePolicy.insurancePolicy.idpaymentMethod != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{paymentMethod.detailSetup}">
                                <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][insurancePolicy.insurancePolicy][insurancePolicy.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentPaymentMethod" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][insurancePolicy.insurancePolicy.idpaymentMethod][paymentMethod.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="insurancePolicy"/>
                                <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.InsurancePolicyController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{paymentMethod.editSetup}">
                                <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][insurancePolicy.insurancePolicy][insurancePolicy.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentPaymentMethod" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][insurancePolicy.insurancePolicy.idpaymentMethod][paymentMethod.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="insurancePolicy"/>
                                <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.InsurancePolicyController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{paymentMethod.destroy}">
                                <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][insurancePolicy.insurancePolicy][insurancePolicy.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentPaymentMethod" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][insurancePolicy.insurancePolicy.idpaymentMethod][paymentMethod.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="insurancePolicy"/>
                                <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.InsurancePolicyController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>

                    <h:outputText value="PolicyReceiptList:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty insurancePolicy.insurancePolicy.policyReceiptList}" value="(No Items)"/>
                        <h:dataTable value="#{insurancePolicy.insurancePolicy.policyReceiptList}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty insurancePolicy.insurancePolicy.policyReceiptList}">
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
                                    <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][insurancePolicy.insurancePolicy][insurancePolicy.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPolicyReceipt" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][policyReceipt.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="insurancePolicy" />
                                    <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.InsurancePolicyController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{policyReceipt.editSetup}">
                                    <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][insurancePolicy.insurancePolicy][insurancePolicy.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPolicyReceipt" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][policyReceipt.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="insurancePolicy" />
                                    <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.InsurancePolicyController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{policyReceipt.destroy}">
                                    <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][insurancePolicy.insurancePolicy][insurancePolicy.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPolicyReceipt" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][policyReceipt.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="insurancePolicy" />
                                    <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.InsurancePolicyController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>
                    <h:outputText value="PolicyCoverageList:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty insurancePolicy.insurancePolicy.policyCoverageList}" value="(No Items)"/>
                        <h:dataTable value="#{insurancePolicy.insurancePolicy.policyCoverageList}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty insurancePolicy.insurancePolicy.policyCoverageList}">
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
                                    <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][insurancePolicy.insurancePolicy][insurancePolicy.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPolicyCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][policyCoverage.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="insurancePolicy" />
                                    <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.InsurancePolicyController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{policyCoverage.editSetup}">
                                    <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][insurancePolicy.insurancePolicy][insurancePolicy.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPolicyCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][policyCoverage.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="insurancePolicy" />
                                    <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.InsurancePolicyController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{policyCoverage.destroy}">
                                    <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][insurancePolicy.insurancePolicy][insurancePolicy.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPolicyCoverage" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][policyCoverage.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="insurancePolicy" />
                                    <f:param name="jsfcrud.relatedControllerType" value="mx.com.qbe.client.bean.InsurancePolicyController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{insurancePolicy.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][insurancePolicy.insurancePolicy][insurancePolicy.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{insurancePolicy.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentInsurancePolicy" value="#{jsfcrud_class['mx.com.qbe.client.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][insurancePolicy.insurancePolicy][insurancePolicy.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{insurancePolicy.createSetup}" value="New InsurancePolicy" />
                <br />
                <h:commandLink action="#{insurancePolicy.listSetup}" value="Show All InsurancePolicy Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
