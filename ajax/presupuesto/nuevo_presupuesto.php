<?php
include('../is_logged.php'); //Archivo verifica que el usario que intenta acceder a la URL esta logueado
/*Inicia validacion del lado del servidor*/
if (empty($_POST['fecha_presupuesto'])) {
	$errors[] = "Fecha vacío";
} else if (!empty($_POST['fecha_presupuesto'])) {
	/* Connect To Database*/
	require_once("../../config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
	require_once("../../config/conexion.php"); //Contiene funcion que conecta a la base de datos
	// escaping, additionally removing everything that could be (html/javascript-) code

	$fecha_presupuesto = mysqli_real_escape_string($con, (strip_tags($_POST["fecha_presupuesto"], ENT_QUOTES)));
	$cantidad_mes_presupuesto = floatval($_POST["cantidad_mes_presupuesto"]);
	$presupuesto_mes =  floatval($_POST["presupuesto_mes"]);
	$cantidad_promos_presupuesto = floatval($_POST["cantidad_promos_presupuesto"]);
	$cantidad_garantia_presupuesto = floatval($_POST["cantidad_garantia_presupuesto"]);
	$codigoVendedor = mysqli_real_escape_string($con, (strip_tags($_POST["codigoVendedor"], ENT_QUOTES)));
	$codigoLinea = mysqli_real_escape_string($con, (strip_tags($_POST["codigoLinea"], ENT_QUOTES)));
	$estado = intval($_POST['estado']);
	$total = $cantidad_mes_presupuesto + $cantidad_promos_presupuesto + $cantidad_garantia_presupuesto;
	$sql = "INSERT INTO presupuesto (fechaPresupuesto, cantidadMesPresupuesto, presupuestoMes, cantidadPromos, cantidadGarantias, cantidadTotal, status, codigoVendedor, codigoLinea) VALUES
	 ('$fecha_presupuesto','$cantidad_mes_presupuesto','$presupuesto_mes','$cantidad_promos_presupuesto','$cantidad_garantia_presupuesto','$total','$estado','$codigoVendedor','$codigoLinea')";
	$query_new_insert = mysqli_query($con, $sql);
	if ($query_new_insert) {
		$messages[] = "Presupuesto ingresado satisfactoriamente.";
	} else {
		$errors[] = "Lo siento algo ha salido mal intenta nuevamente." . mysqli_error($con);
	}
} else {
	$errors[] = "Error desconocido.";
}

if (isset($errors)) {

?>
	<div class="alert alert-danger" role="alert">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<strong>Error!</strong>
		<?php
		foreach ($errors as $error) {
			echo $error;
		}
		?>
	</div>
<?php
}
if (isset($messages)) {

?>
	<div class="alert alert-success" role="alert">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<strong>¡Bien hecho!</strong>
		<?php
		foreach ($messages as $message) {
			echo $message;
		}
		?>
	</div>
<?php
}

?>