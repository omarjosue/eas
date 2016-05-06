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
import mx.com.qbe.eas.model.PaymentMethod;
import mx.com.qbe.eas.services.PaymentMethodFacadeLocal;

/**
 *
 * @author omarjosue
 */
@Path("paymentmethod")
@Stateless
public class PaymentMethodREST{

    @EJB
    private PaymentMethodFacadeLocal paymentMethodBean;

    @POST
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void create(PaymentMethod entity) {
        paymentMethodBean.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void edit(@PathParam("id") Integer id, PaymentMethod entity) {
        paymentMethodBean.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id) {
        paymentMethodBean.remove(paymentMethodBean.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public PaymentMethod find(@PathParam("id") Integer id) {
        return paymentMethodBean.find(id);
    }

    @GET
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<PaymentMethod> findAll() {
        return paymentMethodBean.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<PaymentMethod> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return paymentMethodBean.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces(MediaType.TEXT_PLAIN)
    public String countREST() {
        return String.valueOf(paymentMethodBean.count());
    }
}