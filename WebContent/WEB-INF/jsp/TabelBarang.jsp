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
    <button type="button" class="btn btn-secondary">Edit</button>
    <button type="button" class="btn btn-secondary">Delete</button>
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
<div>
  <table class="table table-border"  id="tabeldata">
      <tr>
       <td>Kode Barang</td>
       <td>Nama Barang</td>
       <td>Harga Jual</td>
       <td>Harga Beli</td>
       <td>Satuan</td>
       <td>Kategori</td>
       <td id="checkbox"><input type="checkbox"> </td> 
      </tr>
      <c:forEach items="${list2}" var="tabelmodel">
      <tr>
       <td>${tabelmodel.kodeBarang}</td>
       <td>${tabelmodel.namaBarang}</td>
       <td>${tabelmodel.hargaJual}</td>
       <td>${tabelmodel.hargaBeli}</td>
       <td>${tabelmodel.satuan}</td>
       <td>${tabelmodel.kategori}</td>
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
 </script> 

</body>
</html>