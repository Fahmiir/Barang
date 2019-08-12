package com.tabel.controller;
import java.util.List;

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
	public String show(Model m){
		List<TabelModel> list=td.getComboBox();
		List<TabelModel> list2=td.getData();
		m.addAttribute("list2", list2);
		m.addAttribute("list",list);
		return "TabelBarang";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("tm") TabelModel tm) {
		td.save(tm);
		return "redirect:/";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("tm") TabelModel tm) {
		td.update(tm, tm.getId());
		return "redirect:/";
	}



}
