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
import mx.com.qbe.eas.model.PolicyCoverage;
import mx.com.qbe.eas.services.PolicyCoverageFacadeLocal;

/**
 *
 * @author omarjosue
 */
@Path("policycoverage")
@Stateless
public class PolicyCoverageREST{

    @EJB
    private PolicyCoverageFacadeLocal policyCoverageBean;

    @POST
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void create(PolicyCoverage entity) {
        policyCoverageBean.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void edit(@PathParam("id") Integer id, PolicyCoverage entity) {
        policyCoverageBean.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id) {
        policyCoverageBean.remove(policyCoverageBean.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public PolicyCoverage find(@PathParam("id") Integer id) {
        return policyCoverageBean.find(id);
    }

    @GET
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<PolicyCoverage> findAll() {
        return policyCoverageBean.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<PolicyCoverage> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return policyCoverageBean.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces(MediaType.TEXT_PLAIN)
    public String countREST() {
        return String.valueOf(policyCoverageBean.count());
    }
}