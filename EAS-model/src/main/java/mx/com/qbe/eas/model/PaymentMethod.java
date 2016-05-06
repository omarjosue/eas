/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.qbe.eas.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author omarjosue
 */
@Entity
@Table(name = "payment_method", catalog = "qbe", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PaymentMethod.findAll", query = "SELECT p FROM PaymentMethod p"),
    @NamedQuery(name = "PaymentMethod.findByIdpaymentMethod", query = "SELECT p FROM PaymentMethod p WHERE p.idpaymentMethod = :idpaymentMethod"),
    @NamedQuery(name = "PaymentMethod.findByDescription", query = "SELECT p FROM PaymentMethod p WHERE p.description = :description"),
    @NamedQuery(name = "PaymentMethod.findByInvoicesQuantity", query = "SELECT p FROM PaymentMethod p WHERE p.invoicesQuantity = :invoicesQuantity")})
public class PaymentMethod implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idpayment_method")
    private Integer idpaymentMethod;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "description")
    private String description;
    @Basic(optional = false)
    @NotNull
    @Column(name = "invoices_quantity")
    private int invoicesQuantity;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idpaymentMethod")
    private List<InsurancePolicy> insurancePolicyList;

    public PaymentMethod() {
    }

    public PaymentMethod(Integer idpaymentMethod) {
        this.idpaymentMethod = idpaymentMethod;
    }

    public PaymentMethod(Integer idpaymentMethod, String description, int invoicesQuantity) {
        this.idpaymentMethod = idpaymentMethod;
        this.description = description;
        this.invoicesQuantity = invoicesQuantity;
    }

    public Integer getIdpaymentMethod() {
        return idpaymentMethod;
    }

    public void setIdpaymentMethod(Integer idpaymentMethod) {
        this.idpaymentMethod = idpaymentMethod;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getInvoicesQuantity() {
        return invoicesQuantity;
    }

    public void setInvoicesQuantity(int invoicesQuantity) {
        this.invoicesQuantity = invoicesQuantity;
    }

    @XmlTransient
    public List<InsurancePolicy> getInsurancePolicyList() {
        return insurancePolicyList;
    }

    public void setInsurancePolicyList(List<InsurancePolicy> insurancePolicyList) {
        this.insurancePolicyList = insurancePolicyList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idpaymentMethod != null ? idpaymentMethod.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PaymentMethod)) {
            return false;
        }
        PaymentMethod other = (PaymentMethod) object;
        if ((this.idpaymentMethod == null && other.idpaymentMethod != null) || (this.idpaymentMethod != null && !this.idpaymentMethod.equals(other.idpaymentMethod))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mx.com.qbe.eas.model.PaymentMethod[ idpaymentMethod=" + idpaymentMethod + " ]";
    }
    
}
