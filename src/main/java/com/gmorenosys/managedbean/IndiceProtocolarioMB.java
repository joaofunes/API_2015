/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.managedbean;

import com.gmorenosys.jasper.Reporte;
import com.gmorenosys.managedbean.form.CurrentUserSessionForm;
import com.gmorenosys.model.Libro;
import com.gmorenosys.model.Notario;
import com.gmorenosys.model.Pasos;
import com.gmorenosys.pojo.rpt.RptIndeceProtocolario;
import com.gmorenosys.service.LibroService;
import com.gmorenosys.service.NotarioService;
import com.gmorenosys.service.PasosService;
import com.gmorenosys.service.UsuarioService;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import javax.annotation.ManagedBean;
import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.primefaces.context.RequestContext;


/**
 *
 * @author Joao
 */

@ManagedBean
@SessionScoped
public class IndiceProtocolarioMB implements Serializable{
    
    private static final long serialVersionUID = 1L;
    private Date date1;
    private Date date2;
    private Date date3;
    private String reportName;
    private String fecha;
    private CurrentUserSessionBean user;
    private CurrentUserSessionForm sessionForm;
    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
    

    private List<Libro> listadoLibroByID;
    private List<Notario> listadoNotario;
    
    @Autowired
    @Qualifier(value = "libroService")
    private LibroService libroService;
    
    @Autowired
    @Qualifier(value = "usuarioService")
    private UsuarioService usuarioService;
    
    
    @Autowired
    @Qualifier(value = "notarioService")
    private NotarioService notarioService;
    
    @Autowired
    @Qualifier(value= "pasosService")
    private PasosService pasosService; 
    
    private Libro libro;
    private Notario notario;
    
    @PostConstruct
    private void init() {
        date3 = new Date();
        libro=new Libro();     
        listadoLibroByID = new ArrayList<Libro>();   
        listadoNotario = new ArrayList<Notario>();
        setListadoNotario(notarioService.findAll());
        
    }

    public IndiceProtocolarioMB() {
        user = new CurrentUserSessionBean();
        sessionForm = user.getForm();
    }
    
    public void inicializar(){
        try {
            if (notario != null) {
                setListadoLibroByID(libroService.getAllByIdNotario(notario.getIdnotario()));
            }
        } catch (Exception e) {
            System.out.println("error inicializacion indice protocolario MB");
        }
    }
    
    public void click(String tip) {
        if (getDate1() == null) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error!", "Fecha Inicial Vacia."));
        } else if (getDate2() == null) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error!", "Fecha Fin Vacia."));
        } else if (getDate2().before(getDate1())) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error!", "Fecha Fin es Menor que Fecha Inicio."));
        } else if (getDate2().equals(getDate1())) {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error!", "Fecha Inicio es Igual que Fecha Fin."));
        } else {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Exito!", "Procesado Reporte."));
String tipo= "pdf";
            generarReporte(tip);

        }

    }
    
     private void generarReporte(String tipo) {
         
        List<RptIndeceProtocolario> list = new ArrayList<RptIndeceProtocolario>();
          
         DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
         Date date = new Date();
         String fechaini = dateFormat.format(date1);
         String fechafin = dateFormat.format(date2);
        
        List<Pasos> listadoPasos = pasosService.getListadoPasos(fechaini, fechafin, libro );
        RptIndeceProtocolario prueba = new RptIndeceProtocolario();
         if (listadoPasos != null) {
             for (Pasos item : listadoPasos) {
                 prueba = new RptIndeceProtocolario();
                 prueba.setFecha(item.getFechafirma().toString());
                 prueba.setFolioDesde(item.getDesde());
                 prueba.setFolioHasta(item.getHasta());
                 prueba.setOtorgante(item.getFavorecido() + "/" + item.getOtorgante());
                 list.add(prueba);
             }
         }
         
        ExternalContext context = FacesContext.getCurrentInstance().getExternalContext();
        HttpServletRequest request = (HttpServletRequest) context.getRequest();
        
        
        HttpServletResponse response = (HttpServletResponse) context.getResponse();
        Reporte reporte = new Reporte();
        reporte = new Reporte("indiceProtocolario", "rpt_indice_protocolario", request);
        reporte.setTipoMime((tipo.equals("Excel")?"xls":"pdf"));
        reporte.setDataSource(new JRBeanCollectionDataSource(new HashSet<RptIndeceProtocolario>(list)));
        reporte.addParameter("fechaInicial", formatter.format(date1));
        reporte.addParameter("fechaFinal", formatter.format(date2));
        reporte.addParameter("usuario", user.getSessionUser().getUsername());
        reporte.addParameter("libro", libro.getNumfolios());
        reporte.addParameter("protocolo", libro.getNumlibro());

        reporte.setReportInSession(request, response);
        reportName=null;
        reportName = reporte.getNombreLogico();
        RequestContext.getCurrentInstance().addCallbackParam("reportName", reportName);
    }
    
    
    
    public Date getDate1() {
        return date1;
    }

    public void setDate1(Date date1) {
        this.date1 = date1;
    }

    public Date getDate2() {
        return date2;
    }

    public void setDate2(Date date2) {
        this.date2 = date2;
    }

    public Date getDate3() {
        return date3;
    }

    public void setDate3(Date date3) {
        this.date3 = date3;
    }

    public String getReportName() {
        return reportName;
    }

    public void setReportName(String reportName) {
        this.reportName = reportName;
    }

    public String getFecha() {
        fecha = formatter.format(date3);
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public List<Libro> getListadoLibroByID() {
        return listadoLibroByID;
    }

    public void setListadoLibroByID(List<Libro> listadoLibroByID) {
        this.listadoLibroByID = listadoLibroByID;
    }

    public Libro getLibro() {
        return libro;
    }

    public void setLibro(Libro libro) {
        this.libro = libro;
    }

    public List<Notario> getListadoNotario() {
        return listadoNotario;
    }

    public void setListadoNotario(List<Notario> listadoNotario) {
        this.listadoNotario = listadoNotario;
    }

    public Notario getNotario() {
        return notario;
    }

    public void setNotario(Notario notario) {
        this.notario = notario;
    }

   

    
    
    
}
