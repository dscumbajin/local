<?php
include('../is_logged.php'); //Archivo verifica que el usario que intenta acceder a la URL esta logueado
/*Inicia validacion del lado del servidor*/
if (empty($_POST['mod_id'])) {
	$errors[] = "ID vacío";
} else if (empty($_POST['mod_cantidad_mes_presupuesto'])) {
	$errors[] = "Cantidad mes vacío";
} else if (empty($_POST['mod_presupuesto_mes'])) {
	$errors[] = "Presupuesto mes vacío";
} else if (empty($_POST['mod_cantidad_promos_presupuesto'])) {
	$errors[] = "Cantidad promos vacío";
} else if (empty($_POST['mod_cantidad_garantia_presupuesto'])) {
	$errors[] = "Cantidad garantía vacío";
} else if (
	!empty($_POST['mod_id']) &&
	!empty($_POST['mod_cantidad_mes_presupuesto']) &&
	!empty($_POST['mod_presupuesto_mes']) &&
	!empty($_POST['mod_cantidad_promos_presupuesto']) &&
	!empty($_POST['mod_cantidad_garantia_presupuesto'])
) {
	/* Connect To Database*/
	require_once("../../config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
	require_once("../../config/conexion.php"); //Contiene funcion que conecta a la base de datos
	// escaping, additionally removing everything that could be (html/javascript-) code


	$cantidad_mes_presupuesto = floatval($_POST["mod_cantidad_mes_presupuesto"]);
	$presupuesto_mes =  floatval($_POST["mod_presupuesto_mes"]);
	$cantidad_promos_presupuesto = floatval($_POST["mod_cantidad_promos_presupuesto"]);
	$cantidad_garantia_presupuesto = floatval($_POST["mod_cantidad_garantia_presupuesto"]);
	$total = $cantidad_mes_presupuesto + $cantidad_promos_presupuesto + $cantidad_garantia_presupuesto;

	$id_presupuesto = intval($_POST['mod_id']);
	$sql = "UPDATE presupuesto SET cantidadMesPresupuesto='" . $cantidad_mes_presupuesto . "', presupuestoMes='" . $presupuesto_mes . "', cantidadPromos='" . $cantidad_promos_presupuesto . "', cantidadGarantias='" . $cantidad_garantia_presupuesto . "', cantidadTotal='" . $total . "' WHERE codigoPresupuesto='" . $id_presupuesto . "'";
	$query_update = mysqli_query($con, $sql);
	if ($query_update) {
		$messages[] = "Registro actualizado satisfactoriamente.";
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