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
import mx.com.qbe.eas.model.InsurancePolicy;
import mx.com.qbe.eas.services.InsurancePolicyFacadeLocal;

/**
 *
 * @author omarjosue
 */
@Path("insurancepolicy")
@Stateless
public class InsurancePolicyREST{

    @EJB (mappedName="InsurancePolicyFacade")
    private InsurancePolicyFacadeLocal insurancePolicyBean;

    @POST
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void create(InsurancePolicy entity) {
        insurancePolicyBean.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void edit(@PathParam("id") Integer id, InsurancePolicy entity) {
        insurancePolicyBean.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id) {
        insurancePolicyBean.remove(insurancePolicyBean.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public InsurancePolicy find(@PathParam("id") Integer id) {
        return insurancePolicyBean.find(id);
    }

    @GET
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<InsurancePolicy> findAll() {
        return insurancePolicyBean.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<InsurancePolicy> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return insurancePolicyBean.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces(MediaType.TEXT_PLAIN)
    public String countREST() {
        return String.valueOf(insurancePolicyBean.count());
    }
}
