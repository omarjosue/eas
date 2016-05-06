/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.qbe.eas.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author omarjosue
 */
@Entity
@Table(name = "policy_receipt", catalog = "qbe", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PolicyReceipt.findAll", query = "SELECT p FROM PolicyReceipt p"),
    @NamedQuery(name = "PolicyReceipt.findByFolio", query = "SELECT p FROM PolicyReceipt p WHERE p.folio = :folio"),
    @NamedQuery(name = "PolicyReceipt.findByCurrentReceipt", query = "SELECT p FROM PolicyReceipt p WHERE p.currentReceipt = :currentReceipt"),
    @NamedQuery(name = "PolicyReceipt.findByType", query = "SELECT p FROM PolicyReceipt p WHERE p.type = :type"),
    @NamedQuery(name = "PolicyReceipt.findBySurchargeTotal", query = "SELECT p FROM PolicyReceipt p WHERE p.surchargeTotal = :surchargeTotal"),
    @NamedQuery(name = "PolicyReceipt.findByTaxTotal", query = "SELECT p FROM PolicyReceipt p WHERE p.taxTotal = :taxTotal"),
    @NamedQuery(name = "PolicyReceipt.findByPrimeTotal", query = "SELECT p FROM PolicyReceipt p WHERE p.primeTotal = :primeTotal"),
    @NamedQuery(name = "PolicyReceipt.findByDueDate", query = "SELECT p FROM PolicyReceipt p WHERE p.dueDate = :dueDate")})
public class PolicyReceipt implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "folio")
    private Integer folio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "current_receipt")
    private int currentReceipt;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "type")
    private String type;
    @Basic(optional = false)
    @NotNull
    @Column(name = "surcharge_total")
    private double surchargeTotal;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tax_total")
    private double taxTotal;
    @Basic(optional = false)
    @NotNull
    @Column(name = "prime_total")
    private double primeTotal;
    @Basic(optional = false)
    @NotNull
    @Column(name = "due_date")
    @Temporal(TemporalType.DATE)
    private Date dueDate;
    @JoinColumn(name = "idinsurance_policy", referencedColumnName = "idinsurance_policy")
    @ManyToOne(optional = false)
    private InsurancePolicy idinsurancePolicy;

    public PolicyReceipt() {
    }

    public PolicyReceipt(Integer folio) {
        this.folio = folio;
    }

    public PolicyReceipt(Integer folio, int currentReceipt, String type, double surchargeTotal, double taxTotal, double primeTotal, Date dueDate) {
        this.folio = folio;
        this.currentReceipt = currentReceipt;
        this.type = type;
        this.surchargeTotal = surchargeTotal;
        this.taxTotal = taxTotal;
        this.primeTotal = primeTotal;
        this.dueDate = dueDate;
    }

    public Integer getFolio() {
        return folio;
    }

    public void setFolio(Integer folio) {
        this.folio = folio;
    }

    public int getCurrentReceipt() {
        return currentReceipt;
    }

    public void setCurrentReceipt(int currentReceipt) {
        this.currentReceipt = currentReceipt;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getSurchargeTotal() {
        return surchargeTotal;
    }

    public void setSurchargeTotal(double surchargeTotal) {
        this.surchargeTotal = surchargeTotal;
    }

    public double getTaxTotal() {
        return taxTotal;
    }

    public void setTaxTotal(double taxTotal) {
        this.taxTotal = taxTotal;
    }

    public double getPrimeTotal() {
        return primeTotal;
    }

    public void setPrimeTotal(double primeTotal) {
        this.primeTotal = primeTotal;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public InsurancePolicy getIdinsurancePolicy() {
        return idinsurancePolicy;
    }

    public void setIdinsurancePolicy(InsurancePolicy idinsurancePolicy) {
        this.idinsurancePolicy = idinsurancePolicy;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (folio != null ? folio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PolicyReceipt)) {
            return false;
        }
        PolicyReceipt other = (PolicyReceipt) object;
        if ((this.folio == null && other.folio != null) || (this.folio != null && !this.folio.equals(other.folio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mx.com.qbe.eas.model.PolicyReceipt[ folio=" + folio + " ]";
    }
    
}
