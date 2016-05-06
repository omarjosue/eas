/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.qbe.eas.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author omarjosue
 */
@Entity
@Table(name = "policy_coverage", catalog = "qbe", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PolicyCoverage.findAll", query = "SELECT p FROM PolicyCoverage p"),
    @NamedQuery(name = "PolicyCoverage.findByIdpolicyCoverage", query = "SELECT p FROM PolicyCoverage p WHERE p.idpolicyCoverage = :idpolicyCoverage"),
    @NamedQuery(name = "PolicyCoverage.findBySumAssured", query = "SELECT p FROM PolicyCoverage p WHERE p.sumAssured = :sumAssured"),
    @NamedQuery(name = "PolicyCoverage.findByPrime", query = "SELECT p FROM PolicyCoverage p WHERE p.prime = :prime"),
    @NamedQuery(name = "PolicyCoverage.findByComission", query = "SELECT p FROM PolicyCoverage p WHERE p.comission = :comission")})
public class PolicyCoverage implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idpolicy_coverage")
    private Integer idpolicyCoverage;
    @Basic(optional = false)
    @NotNull
    @Column(name = "sum_assured")
    private double sumAssured;
    @Basic(optional = false)
    @NotNull
    @Column(name = "prime")
    private double prime;
    @Basic(optional = false)
    @NotNull
    @Column(name = "comission")
    private double comission;
    @JoinColumn(name = "idinsurance_policy", referencedColumnName = "idinsurance_policy")
    @ManyToOne(optional = false)
    private InsurancePolicy idinsurancePolicy;
    @JoinColumn(name = "idcoverage", referencedColumnName = "idcoverage")
    @ManyToOne(optional = false)
    private Coverage idcoverage;

    public PolicyCoverage() {
    }

    public PolicyCoverage(Integer idpolicyCoverage) {
        this.idpolicyCoverage = idpolicyCoverage;
    }

    public PolicyCoverage(Integer idpolicyCoverage, double sumAssured, double prime, double comission) {
        this.idpolicyCoverage = idpolicyCoverage;
        this.sumAssured = sumAssured;
        this.prime = prime;
        this.comission = comission;
    }

    public Integer getIdpolicyCoverage() {
        return idpolicyCoverage;
    }

    public void setIdpolicyCoverage(Integer idpolicyCoverage) {
        this.idpolicyCoverage = idpolicyCoverage;
    }

    public double getSumAssured() {
        return sumAssured;
    }

    public void setSumAssured(double sumAssured) {
        this.sumAssured = sumAssured;
    }

    public double getPrime() {
        return prime;
    }

    public void setPrime(double prime) {
        this.prime = prime;
    }

    public double getComission() {
        return comission;
    }

    public void setComission(double comission) {
        this.comission = comission;
    }

    public InsurancePolicy getIdinsurancePolicy() {
        return idinsurancePolicy;
    }

    public void setIdinsurancePolicy(InsurancePolicy idinsurancePolicy) {
        this.idinsurancePolicy = idinsurancePolicy;
    }

    public Coverage getIdcoverage() {
        return idcoverage;
    }

    public void setIdcoverage(Coverage idcoverage) {
        this.idcoverage = idcoverage;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idpolicyCoverage != null ? idpolicyCoverage.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PolicyCoverage)) {
            return false;
        }
        PolicyCoverage other = (PolicyCoverage) object;
        if ((this.idpolicyCoverage == null && other.idpolicyCoverage != null) || (this.idpolicyCoverage != null && !this.idpolicyCoverage.equals(other.idpolicyCoverage))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mx.com.qbe.eas.model.PolicyCoverage[ idpolicyCoverage=" + idpolicyCoverage + " ]";
    }
    
}
