package com.tabel.controller;
import org.springframework.beans.factory.annotation.Autowired;    
import org.springframework.stereotype.Controller;  
import org.springframework.ui.Model;  
import org.springframework.web.bind.annotation.ModelAttribute;    
import org.springframework.web.bind.annotation.PathVariable;    
import org.springframework.web.bind.annotation.RequestMapping;    
import org.springframework.web.bind.annotation.RequestMethod; 
import com.tabel.dao.TabelDao;
import com.tabel.model.TabelModel;
@Controller 

public class TabelController {
@Autowired
TabelDao td;

@RequestMapping(value="/",method=RequestMethod.GET)
public String show( TabelModel tm){
return "TabelBarang";
}

@RequestMapping(value="/save",method=RequestMethod.POST)
public String save(@ModelAttribute("tm") TabelModel tm){
td.save(tm);
return "redirect:/";
}


}
