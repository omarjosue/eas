/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.qbe.rest;

import java.util.List;
import javax.ejb.*;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import mx.com.qbe.eas.model.PolicyReceipt;
import mx.com.qbe.eas.services.PolicyReceiptFacadeLocal;

/**
 *
 * @author omarjosue
 */
@Path("policyreceipt")
@Stateless
public class PolicyReceiptREST{

    @EJB
    private PolicyReceiptFacadeLocal policyReceiptBean;

    @POST
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void create(PolicyReceipt entity) {
        policyReceiptBean.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void edit(@PathParam("id") Integer id, PolicyReceipt entity) {
        policyReceiptBean.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id) {
        policyReceiptBean.remove(policyReceiptBean.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public PolicyReceipt find(@PathParam("id") Integer id) {
        return policyReceiptBean.find(id);
    }

    @GET
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<PolicyReceipt> findAll() {
        return policyReceiptBean.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<PolicyReceipt> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return policyReceiptBean.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces(MediaType.TEXT_PLAIN)
    public String countREST() {
        return String.valueOf(policyReceiptBean.count());
    }
}