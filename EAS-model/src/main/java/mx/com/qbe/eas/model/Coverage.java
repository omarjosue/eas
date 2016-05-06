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
@Table(name = "coverage", catalog = "qbe", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Coverage.findAll", query = "SELECT c FROM Coverage c"),
    @NamedQuery(name = "Coverage.findByIdcoverage", query = "SELECT c FROM Coverage c WHERE c.idcoverage = :idcoverage"),
    @NamedQuery(name = "Coverage.findByConcept", query = "SELECT c FROM Coverage c WHERE c.concept = :concept"),
    @NamedQuery(name = "Coverage.findByDescription", query = "SELECT c FROM Coverage c WHERE c.description = :description")})
public class Coverage implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idcoverage")
    private Integer idcoverage;
    @Basic(optional = false)
    @NotNull
    @Column(name = "concept")
    private int concept;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "description")
    private String description;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idcoverage")
    private List<PolicyCoverage> policyCoverageList;

    public Coverage() {
    }

    public Coverage(Integer idcoverage) {
        this.idcoverage = idcoverage;
    }

    public Coverage(Integer idcoverage, int concept, String description) {
        this.idcoverage = idcoverage;
        this.concept = concept;
        this.description = description;
    }

    public Integer getIdcoverage() {
        return idcoverage;
    }

    public void setIdcoverage(Integer idcoverage) {
        this.idcoverage = idcoverage;
    }

    public int getConcept() {
        return concept;
    }

    public void setConcept(int concept) {
        this.concept = concept;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @XmlTransient
    public List<PolicyCoverage> getPolicyCoverageList() {
        return policyCoverageList;
    }

    public void setPolicyCoverageList(List<PolicyCoverage> policyCoverageList) {
        this.policyCoverageList = policyCoverageList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idcoverage != null ? idcoverage.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Coverage)) {
            return false;
        }
        Coverage other = (Coverage) object;
        if ((this.idcoverage == null && other.idcoverage != null) || (this.idcoverage != null && !this.idcoverage.equals(other.idcoverage))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mx.com.qbe.eas.model.Coverage[ idcoverage=" + idcoverage + " ]";
    }
    
}
