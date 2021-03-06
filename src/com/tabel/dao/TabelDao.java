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

public int update (TabelModel tm, int id){
String sql = "UPDATE tabelmasterbarang set KodeBarang='"+tm.getKodeBarang()+"',NamaBarang='"+tm.getNamaBarang()+"',HargaJual='"+tm.getHargaJual()+"',HargaBeli='"+tm.getHargaJual()+"',Satuan='"+tm.getSatuan()+"',Kategori='"+tm.getKategori()+"' WHERE ID='"+tm.getId()+"'";	
return template.update(sql);
}

public List<TabelModel> getComboBox(){
	return template.query("SELECT Kategori FROM tabelmasterkategori",new RowMapper<TabelModel>(){
		public TabelModel mapRow(ResultSet rs,int row)throws SQLException {
			TabelModel t = new TabelModel();
			t.setKategori(rs.getString(1));
			return t;
		}
	});
}

public List<TabelModel> getData(){
	return template.query("SELECT ID,KodeBarang,NamaBarang,HargaJual,HargaBeli,Satuan,Kategori FROM tabelmasterbarang",new RowMapper<TabelModel>(){
		public TabelModel mapRow(ResultSet rs,int row)throws SQLException{
			TabelModel t = new TabelModel();
			t.setId(rs.getInt(1));
			t.setKodeBarang(rs.getInt(2));
			t.setNamaBarang(rs.getString(3));
			t.setHargaJual(rs.getInt(4));
			t.setHargaBeli(rs.getInt(5));
			t.setSatuan(rs.getString(6));
			t.setKategori(rs.getString(7));
			return t;
		}	
	});
}



	
	
}
