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
import mx.com.qbe.eas.model.Coverage;
import mx.com.qbe.eas.services.CoverageFacadeLocal;

/**
 *
 * @author omarjosue
 */
@Path("coverage")
@Stateless
public class CoverageREST{

    @EJB
    private CoverageFacadeLocal coverageBean;

    @POST
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void create(Coverage entity) {
        coverageBean.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void edit(@PathParam("id") Integer id, Coverage entity) {
        coverageBean.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id) {
        coverageBean.remove(coverageBean.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Coverage find(@PathParam("id") Integer id) {
        return coverageBean.find(id);
    }

    @GET
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Coverage> findAll() {
        return coverageBean.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Coverage> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return coverageBean.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces(MediaType.TEXT_PLAIN)
    public String countREST() {
        return String.valueOf(coverageBean.count());
    }
}