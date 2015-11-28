/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gmorenosys.model.managedbean.crud.converter;

import com.gmorenosys.model.Clientes;
import com.gmorenosys.service.ClientesService;

import com.gmorenosys.model.managedbean.crud.util.JsfUtil;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Joao
 */
@Component(value = "clienteConverter")
public class ClienteConverter implements Converter {
    
    @Autowired
    private ClientesService clientesService;
    
    
     @Override
    public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
        if (value == null || value.length() == 0 || JsfUtil.isDummySelectItem(component, value)) {
            return null;
        }
        return this.clientesService.findById(getKey(value));
    }

   @Override
    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null
                || (object instanceof String && ((String) object).length() == 0)) {
            return null;
        }
        if (object instanceof Clientes) {
            Clientes o = (Clientes) object;
            return getStringKey(o.getIdcliente());
        } else {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "object {0} is of type {1}; expected type: {2}", new Object[]{object, object.getClass().getName(), Clientes.class.getName()});
            return null;
        }
    }
    
    java.lang.Integer getKey(String value) {
        java.lang.Integer key;
        key = Integer.valueOf(value);
        return key;
    }

    String getStringKey(java.lang.Integer value) {
        StringBuilder sb = new StringBuilder();
        sb.append(value);
        return sb.toString();
    }
    
    
}
