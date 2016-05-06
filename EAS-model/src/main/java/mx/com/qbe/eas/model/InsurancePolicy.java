/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.qbe.eas.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author omarjosue
 */
@Entity
@Table(name = "insurance_policy", catalog = "qbe", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "InsurancePolicy.findAll", query = "SELECT i FROM InsurancePolicy i"),
    @NamedQuery(name = "InsurancePolicy.findByIdinsurancePolicy", query = "SELECT i FROM InsurancePolicy i WHERE i.idinsurancePolicy = :idinsurancePolicy"),
    @NamedQuery(name = "InsurancePolicy.findByNumber", query = "SELECT i FROM InsurancePolicy i WHERE i.number = :number"),
    @NamedQuery(name = "InsurancePolicy.findByType", query = "SELECT i FROM InsurancePolicy i WHERE i.type = :type"),
    @NamedQuery(name = "InsurancePolicy.findByCustomer", query = "SELECT i FROM InsurancePolicy i WHERE i.customer = :customer"),
    @NamedQuery(name = "InsurancePolicy.findByStartDate", query = "SELECT i FROM InsurancePolicy i WHERE i.startDate = :startDate"),
    @NamedQuery(name = "InsurancePolicy.findByEndDate", query = "SELECT i FROM InsurancePolicy i WHERE i.endDate = :endDate"),
    @NamedQuery(name = "InsurancePolicy.findByCurrency", query = "SELECT i FROM InsurancePolicy i WHERE i.currency = :currency"),
    @NamedQuery(name = "InsurancePolicy.findByAgent", query = "SELECT i FROM InsurancePolicy i WHERE i.agent = :agent"),
    @NamedQuery(name = "InsurancePolicy.findBySurcharge", query = "SELECT i FROM InsurancePolicy i WHERE i.surcharge = :surcharge"),
    @NamedQuery(name = "InsurancePolicy.findByTax", query = "SELECT i FROM InsurancePolicy i WHERE i.tax = :tax"),
    @NamedQuery(name = "InsurancePolicy.findByExchangeRate", query = "SELECT i FROM InsurancePolicy i WHERE i.exchangeRate = :exchangeRate"),
    @NamedQuery(name = "InsurancePolicy.findByStatus", query = "SELECT i FROM InsurancePolicy i WHERE i.status = :status")})
public class InsurancePolicy implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idinsurance_policy")
    private Integer idinsurancePolicy;
    @Basic(optional = false)
    @NotNull
    @Column(name = "number")
    private long number;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "type")
    private String type;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "customer")
    private String customer;
    @Basic(optional = false)
    @NotNull
    @Column(name = "start_date")
    @Temporal(TemporalType.DATE)
    private Date startDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "end_date")
    @Temporal(TemporalType.DATE)
    private Date endDate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "currency")
    private String currency;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "agent")
    private String agent;
    @Basic(optional = false)
    @NotNull
    @Column(name = "surcharge")
    private int surcharge;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tax")
    private int tax;
    @Basic(optional = false)
    @NotNull
    @Column(name = "exchange_rate")
    private float exchangeRate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "status")
    private String status;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idinsurancePolicy")
    private List<PolicyReceipt> policyReceiptList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idinsurancePolicy")
    private List<PolicyCoverage> policyCoverageList;
    @JoinColumn(name = "idpayment_method", referencedColumnName = "idpayment_method")
    @ManyToOne(optional = false)
    private PaymentMethod idpaymentMethod;

    public InsurancePolicy() {
    }

    public InsurancePolicy(Integer idinsurancePolicy) {
        this.idinsurancePolicy = idinsurancePolicy;
    }

    public InsurancePolicy(Integer idinsurancePolicy, long number, String type, String customer, Date startDate, Date endDate, String currency, String agent, int surcharge, int tax, float exchangeRate, String status) {
        this.idinsurancePolicy = idinsurancePolicy;
        this.number = number;
        this.type = type;
        this.customer = customer;
        this.startDate = startDate;
        this.endDate = endDate;
        this.currency = currency;
        this.agent = agent;
        this.surcharge = surcharge;
        this.tax = tax;
        this.exchangeRate = exchangeRate;
        this.status = status;
    }

    public Integer getIdinsurancePolicy() {
        return idinsurancePolicy;
    }

    public void setIdinsurancePolicy(Integer idinsurancePolicy) {
        this.idinsurancePolicy = idinsurancePolicy;
    }

    public long getNumber() {
        return number;
    }

    public void setNumber(long number) {
        this.number = number;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getAgent() {
        return agent;
    }

    public void setAgent(String agent) {
        this.agent = agent;
    }

    public int getSurcharge() {
        return surcharge;
    }

    public void setSurcharge(int surcharge) {
        this.surcharge = surcharge;
    }

    public int getTax() {
        return tax;
    }

    public void setTax(int tax) {
        this.tax = tax;
    }

    public float getExchangeRate() {
        return exchangeRate;
    }

    public void setExchangeRate(float exchangeRate) {
        this.exchangeRate = exchangeRate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @XmlTransient
    public List<PolicyReceipt> getPolicyReceiptList() {
        return policyReceiptList;
    }

    public void setPolicyReceiptList(List<PolicyReceipt> policyReceiptList) {
        this.policyReceiptList = policyReceiptList;
    }

    @XmlTransient
    public List<PolicyCoverage> getPolicyCoverageList() {
        return policyCoverageList;
    }

    public void setPolicyCoverageList(List<PolicyCoverage> policyCoverageList) {
        this.policyCoverageList = policyCoverageList;
    }

    public PaymentMethod getIdpaymentMethod() {
        return idpaymentMethod;
    }

    public void setIdpaymentMethod(PaymentMethod idpaymentMethod) {
        this.idpaymentMethod = idpaymentMethod;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idinsurancePolicy != null ? idinsurancePolicy.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InsurancePolicy)) {
            return false;
        }
        InsurancePolicy other = (InsurancePolicy) object;
        if ((this.idinsurancePolicy == null && other.idinsurancePolicy != null) || (this.idinsurancePolicy != null && !this.idinsurancePolicy.equals(other.idinsurancePolicy))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mx.com.qbe.eas.model.InsurancePolicy[ idinsurancePolicy=" + idinsurancePolicy + " ]";
    }
    
}
