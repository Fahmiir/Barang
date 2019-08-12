<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/Style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 
 
<title>Insert title here</title>
</head>
<body>
<div id="button">
    <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#addModal">Add</button>
    <button type="button" class="btn btn-secondary" data-toggle="modal" data_target="#editModal" onClick="checkBox()">Edit</button>
    <button type="button" class="btn btn-secondary">Delete</button>
    <button type="button" class="btn btn-secondary" id="print">Print</button>
</div>
<div class="modal fade" id="addModal" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
         <h4 class="modal-title">Add Data</h4>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
      <form method="post" action="save" >
          <div class="form-group">
            <label for="Kode Barang">Kode Barang</label>
            <input type="text" class="form-control" name="KodeBarang"> 
          </div>
          <div class="form-group">
            <label for="Nama Barang">Nama Barang</label>
            <input type="text" class="form-control" name="NamaBarang">
          </div>
          <div class="form-group">
            <label for="Harga Beli">Harga Beli</label>
            <input type="text" class="form-control" name="HargaBeli">
          </div>
          <div>
            <label for="Harga Jual">Harga Jual</label>
            <input type="text" class="form-control" name="HargaJual">
          </div>
          <div>
            <label for="Satuan">Satuan</label>
            <input type="text" class="form-control" name="Satuan">
          </div>
          <br>
          <select name="Kategori">
             <c:forEach items="${list}" var="tabelmodel">
             <option value ="${tabelmodel.kategori}">${tabelmodel.kategori}</option>
             </c:forEach>
          </select>
          <br>
          
          <div class="modal-footer">
          <input type="submit" value="Save">
          </div>
      </form>
          
      </div>
      
    </div>
   </div>
</div>

<div class="modal fade" id="editModal" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
         <h4 class="modal-title">Edit Data</h4>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
      <form method="post" var="tabelmodel" action="edit">
      	<div class="form-group">
            <input type="text" class="form-control" style="display:none" name="id" id="editId"> 
          </div>
          <div class="form-group">
            <label for="Kode Barang">Kode Barang</label>
            <input type="text" class="form-control" name="KodeBarang" id="editkodebarang"> 
          </div>
          <div class="form-group">
            <label for="Nama Barang">Nama Barang</label>
            <input type="text" class="form-control" name="NamaBarang" id="editnamabarang">
          </div>
          <div class="form-group">
            <label for="Harga Beli">Harga Beli</label>
            <input type="text" class="form-control" name="HargaBeli" id="edithargabeli">
          </div>
          <div>
            <label for="Harga Jual">Harga Jual</label>
            <input type="text" class="form-control" name="HargaJual" id="edithargajual">
          </div>
          <div>
            <label for="Satuan">Satuan</label>
            <input type="text" class="form-control" name="Satuan" id="editsatuan">
          </div>
          <br>
          <select name="Kategori" id="editKategori">
             <c:forEach items="${list}" var="tabelmodel">
             <option value ="${tabelmodel.kategori}">${tabelmodel.kategori}</option>
             </c:forEach>
          </select>
          <br>
          
          <div class="modal-footer">
          <input type="submit" value="Save">
          </div>
      </form>
          
      </div>
      
    </div>
   </div>
</div>

<div>
  <table class="table table-border"  id="tabeldata">
      <tr>
       <td>Kode Barang</td>
       <td>Nama Barang</td>
       <td>Harga Jual</td>
       <td>Harga Beli</td>
       <td>Satuan</td>
       <td>Kategori</td>
       <td id="checkbox"><input type="checkbox" id="check"> </td> 
      </tr>
      <c:forEach items="${list2}" var="tabelmodel">
      <tr class="row-select">
       <td class="id" style="display:none">${tabelmodel.id}</td>
       <td class="kodeBarang">${tabelmodel.kodeBarang}</td>
       <td class="namaBarang">${tabelmodel.namaBarang}</td>
       <td class="hargaJual">${tabelmodel.hargaJual}</td>
       <td class="hargaBeli">${tabelmodel.hargaBeli}</td>
       <td class="satuan">${tabelmodel.satuan}</td>
       <td class="kategori">${tabelmodel.kategori}</td>
       <td><input type="checkbox"></td>
      </tr>
      </c:forEach>
    </table>
    <p align="center" style="display: none" id="display"> Tidak ada data untuk ditampilkan</p>
    <p id="demo"></p>
</div>

<script>
var row = document.getElementById("tabeldata").rows.length-1;
if(row==0){
document.getElementById("display").style="block";
}

function checkBox() {
var check = document.querySelectorAll('input[type="checkbox"]:checked').length;
if(document.getElementById('check').checked){
	check--;
}

if(check == 1 && !document.getElementById('check').checked){
	$('#editModal').modal('show');
} else {
	alert("pilih salah satu data")
} 
}

$(document).ready(function(){
	$('#editModal').on('show.bs.modal', function (e) {
		$('.row-select input:checked').each(function() {
			var id         = $(this).closest('tr').find('.id').html();
			var kodeBarang = $(this).closest('tr').find('.kodeBarang').html();
			var namaBarang = $(this).closest('tr').find('.namaBarang').html();
			var hargaJual  = $(this).closest('tr').find('.hargaJual').html();
			var hargaBeli  = $(this).closest('tr').find('.hargaBeli').html();
			var satuan     = $(this).closest('tr').find('.satuan').html();
			var kategori   = $(this).closest('tr').find('.kategori').html();
			var mySelect   = document.getElementById('editKategori');
			$('#editId').val(id);
			$('#editkodebarang').val(kodeBarang);
			$('#editnamabarang').val(namaBarang);
			$('#edithargajual').val(hargaJual);
			$('#edithargabeli').val(hargaBeli);
			$('#editsatuan').val(satuan);
			
			for(var i,j = 0; i=mySelect.options[j];j++){
				if(i.value == kategori) {
					mySelect.selectedIndex = j;
					break;
				}
			}
		}
		)
	}
	)
})

$("#print").on('click',function(){
	var print = document.getElementById("tabeldata");
	newWin = window.open("","_self");
	newWin.document.write("<style>td:nth-child(7){display:none;}</style>");
	newWin.document.write(print.outerHTML);
	newWin.print();
})
 </script> 

</body>
</html>