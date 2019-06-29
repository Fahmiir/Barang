package com.tabel.dao;
import java.sql.ResultSet;    
import java.sql.SQLException;    
import java.util.List;    
import org.springframework.jdbc.core.BeanPropertyRowMapper;    
import org.springframework.jdbc.core.JdbcTemplate;    
import org.springframework.jdbc.core.RowMapper;    
import com.tabel.model.TabelModel;    

public class TabelDao {

JdbcTemplate template;

public void setTemplate(JdbcTemplate template) {    
    this.template = template;    
}    

public int save (TabelModel tm){
String sql = "INSERT INTO tabelmasterbarang (KodeBarang, NamaBarang, HargaJual, HargaBeli , Satuan, Kategori) values('"+tm.getKodeBarang()+"','"+tm.getNamaBarang()+"','"+tm.getHargaJual()+"','"+tm.getHargaBeli()+"','"+tm.getSatuan()+"','"+tm.getKategori()+"')";
	return template.update(sql);
}

	
	
}
