/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.managedbean;

import com.gmorenosys.jasper.Reporte;
import com.gmorenosys.managedbean.form.CurrentUserSessionForm;
import com.gmorenosys.model.Autenticas;
import com.gmorenosys.model.Notario;
import com.gmorenosys.pojo.rpt.RptCompraVenta;
import com.gmorenosys.service.AutenticasService;
import com.gmorenosys.service.NotarioService;
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
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.primefaces.context.RequestContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

/**
 *
 * @author Joao
 */


@ManagedBean
@SessionScoped
public class AutenticasMB implements Serializable{
    
    private static final long serialVersionUID = 1L;
    private Date date1;
    private Date date2;
    private Date date3;
    private String reportName;
    private String fecha;
    private CurrentUserSessionBean user;
    private CurrentUserSessionForm sessionForm;
    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
    
    private List<Notario> listadoNotario;
    private Notario notario;
    
    private List<Autenticas> autenticaList;
    private Autenticas autenticas;
    
    
    @Autowired
    @Qualifier(value = "notarioService")
    private NotarioService notarioService;
            
    @Autowired
    @Qualifier(value = "autenticasService")
    private AutenticasService autenticasService;
            
            
    @PostConstruct
    private void init() {
        date3 = new Date();
        notario=new Notario();        
        listadoNotario = new ArrayList<Notario>();        
        setListadoNotario(notarioService.findAll()); 
    }
    
    
    public void inicializador(){
         try {
            setAutenticaList(null); 
            if (notario != null) {              
                setAutenticaList(autenticasService.getAllAutenticasHQL(notario.getIdnotario()));
            }
        } catch (Exception e) {
            System.out.println("error inicializacion CompraVenta vehiculos MB");
        }
    }
    
    
     public void click() {
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

            generarReporte();

        }

    }
    
     private void generarReporte() {
         
        List<RptCompraVenta> list = new ArrayList<RptCompraVenta>();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String fechaini = dateFormat.format(date1);
        String fechafin = dateFormat.format(date2);
        
//        List<Venta> listado = ventaService.getListadoVenta(fechaini, fechafin, cliente );
//        RptCompraVenta prueba = new RptCompraVenta();
//         if (listado != null) {
//            for (Venta item : listado) {
//                 prueba = new RptCompraVenta();
//                 prueba.setMarca(item.getIdvehiculo().getMarca());
//                 prueba.setModelo(item.getIdvehiculo().getModelo());
//                 prueba.setMotor(item.getIdvehiculo().getMotor());
//                 prueba.setPlaca(item.getIdvehiculo().getPlaca());
//                 prueba.setChasis(item.getIdvehiculo().getChasis());
//                 prueba.setNumcv(item.getNumcv()+"");
//                 prueba.setPrecio(item.getPrecio()+"");
//                 prueba.setFechacv(item.getFechacv()+"");
//                 list.add(prueba);
//             }
//         }
         
        ExternalContext context = FacesContext.getCurrentInstance().getExternalContext();
        HttpServletRequest request = (HttpServletRequest) context.getRequest();
        HttpServletResponse response = (HttpServletResponse) context.getResponse();
        Reporte reporte = new Reporte("compraventa", "rpt_compraventa", request);
        reporte.setDataSource(new JRBeanCollectionDataSource(new HashSet<RptCompraVenta>(list)));
        reporte.addParameter("fechaInicial", formatter.format(date1));
        reporte.addParameter("fechaFinal", formatter.format(date2));
        reporte.addParameter("usuario", user.getSessionUser().getUsername());
        reporte.addParameter("notario", notario.getNombre());
     //   reporte.addParameter("cliente", cliente.getNombre());

        reporte.setReportInSession(request, response);
        reportName = reporte.getNombreLogico();
        RequestContext.getCurrentInstance().addCallbackParam("reportName", reportName);
    }
    
    public AutenticasMB() {
        user = new CurrentUserSessionBean();
        sessionForm = user.getForm();
    }        

    public Notario getNotario() {
        return notario;
    }

    public void setNotario(Notario notario) {
        this.notario = notario;
    }

    public Autenticas getAutenticas() {
        return autenticas;
    }

    public void setAutenticas(Autenticas autenticas) {
        this.autenticas = autenticas;
    }

    public List<Notario> getListadoNotario() {
        return listadoNotario;
    }

    public void setListadoNotario(List<Notario> listadoNotario) {
        this.listadoNotario = listadoNotario;
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

    public String getFecha() {
        fecha = formatter.format(date3);
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public List<Autenticas> getAutenticaList() {
        return autenticaList;
    }

    public void setAutenticaList(List<Autenticas> autenticaList) {
        this.autenticaList = autenticaList;
    }
            
            
}
