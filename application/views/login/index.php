<?php /*https://codeshare.io/QnONnq*/
defined('BASEPATH') OR exit('No direct script access allowed');

//print_r($articulos);

?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Sindicato Unico de Trabajadores de la UTeM</title>
	<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!--Axios para peticiones GET y POST -->	
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>


<link rel="stylesheet" href="<?php echo base_url() ?>assets/css/styles.css">


<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide|Sofia|Trirong">

</head>
  <body>
    <h1>Bienvenidos</h1>
    <hr>
    
    <header>
      <div class="mt-2 bg-success">
        <div class="d-flex justify-content-between align-items-center">
        <div>				
          <img  class="m-2 logo"  src="<?php echo base_url()?>assets/img/logo_login.png" alt="Universidad Tecnológica de Manzanillo">
          </div>
        <div class="m-2 tit">
          <h1 > Sistema Integral de Información Sindicato Unico de Trabajadores de la UTeM (SIISUTUTeM) </h1>
        </div>
        <div class="m-2"></div>
      </div>
    </header>
    <main >
      <section class=" align-items-center justify-content-center">
        <div class="input-group p-3 input-group-sm inp">
          <div class="input-group-prepend">
              <span class="input-group-text">Usuario</span>
          </div>
          <input type="text" class="form-control" id='txtUser' name='txtUser'>
        </div>
      </section>
      <section class="align-items-center justify-content-center" >
        <div class="input-group p-3 input-group-sm inp">
          <div class="input-group-prepend">
              <span class="input-group-text">Contraseña</span>
          </div>
          <input type="password" class="form-control" id='txtPsw' name='txtPsw'>
        </div>
      </section>
      <section class="align-items-center justify-content-center" >
        <button type="submit" class="btn btn-success" name="btnIngresar" onclick="this.value = '1'">Ingresar</button>
        <button type="submit" class="btn btn-link" name="btnRegistrarme" onclick="this.value = '1'">Registrarme</button>
      </section>
    </main>
    <footer >
      <h3 class="p-4  bg-success"> DERECHOS RESERVADOS 2021 </h3>
    </footer>
  </body>
</html>

<style> 
	h3{
		text-align: center;
		color: white;
		font-size: 15px;
	}
</style>