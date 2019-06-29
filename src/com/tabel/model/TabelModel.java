package com.tabel.model;

public class TabelModel {
	
private int KodeBarang;
private String NamaBarang;
private int HargaJual;
private int HargaBeli;
private String Satuan;
private String Kategori;

		public int getKodeBarang(){
			return KodeBarang;
		}
		
		public void setKodeBarang(int KodeBarang){
			this.KodeBarang=KodeBarang;
		}
		
		public String getNamaBarang(){
			return NamaBarang;
		}
		
		public void setNamaBarang(String NamaBarang){
			this.NamaBarang=NamaBarang;
		}
		
		public int getHargaJual(){
			return HargaJual;
		}
		
		public void setHargaJual(int HargaJual){
			this.HargaJual=HargaJual;
		}
		
		public int getHargaBeli(){
			return HargaBeli;
		}
		
		public void setHargaBeli(int HargaBeli){
			this.HargaBeli=HargaBeli;
		}
		
		public String getSatuan(){
			return Satuan;
		}
		
		public void setSatuan(String Satuan){
			this.Satuan=Satuan;
		}
		
		public String getKategori(){
			return Kategori;
		}
		
		public void setKategori(String Kategori){
			this.Kategori=Kategori;
		}
}
