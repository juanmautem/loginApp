
	<header>
		<div class="mt-2 bg-success">
			<div class="d-flex justify-content-between align-items-center">
			<div>				
				<img  class="m-2 logo"  src="<?php echo base_url()?>assets/img/logo_login.png" alt="Universidad Tecnológica de Manzanillo">
				</div>
			<div class="m-2 tit">
				<h1 > Sistema Integral de Información para el Quehacer Docente UTeM </h1>
			</div>
			<div class="m-2"></div>
    </div>
	</header>
	<main class="d-flex justify-content-center align-items-center flex-column" >
		<section class= "mb-3 p-2">
			<div class="input-group inp">
				<div class="input-group-prepend">
						<span class="input-group-text">Usuario</span>
				</div>
				<input type="text" class="form-control" id='txtUser' name='txtUser'>
			</div>
		</section>
		<section class= "mb-3 p-2">
			<div class="input-group inp">
				<div class="input-group-prepend">
						<span class="input-group-text">Contraseña</span>
				</div>
				<input type="password" class="form-control" id='txtPsw' name='txtPsw'>
			</div>
		</section>
		<section class= "mb-3 p-2">
			<button type="submit" class="btn btn-success" name="btnIngresar" onclick="this.value = '1'">Ingresar</button>
			<button type="submit" class="btn btn-link" name="btnRegistrarme" onclick="this.value = '1'">Registrarme</button>
		</section>
	</main>
