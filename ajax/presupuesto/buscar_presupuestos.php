<?php

include('../is_logged.php'); //Archivo verifica que el usario que intenta acceder a la URL esta logueado
/* Connect To Database*/
require_once("../../config/db.php"); //Contiene las variables de configuracion para conectar a la base de datos
require_once("../../config/conexion.php"); //Contiene funcion que conecta a la base de datos

$action = (isset($_REQUEST['action']) && $_REQUEST['action'] != NULL) ? $_REQUEST['action'] : '';
if (isset($_GET['id'])) {
	$id_presupuesto = $_GET['id'];

	if ($delete1 = mysqli_query($con, "DELETE FROM presupuesto WHERE codigoPresupuesto='" . $id_presupuesto . "'")) {
?>
		<div class="alert alert-success alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<strong>Aviso!</strong> Datos eliminados exitosamente.
		</div>
	<?php
	} else {
	?>
		<div class="alert alert-danger alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<strong>Error!</strong> Lo siento algo ha salido mal intenta nuevamente.
		</div>
	<?php

	}
}

if ($action == 'ajax') {
	// escaping, additionally removing everything that could be (html/javascript-) code
	$q = mysqli_real_escape_string($con, (strip_tags($_REQUEST['q'], ENT_QUOTES)));
	$aColumns = array('fechaPresupuesto', 'codigoPresupuesto'); //Columnas de busqueda
	$sTable = "presupuesto, vendedor, listalinea";
	$sWhere = "WHERE presupuesto.codigoLinea = listalinea.codigoLinea
	AND presupuesto.codigoVendedor = vendedor.codigoVendedor ";
	if ($_GET['q'] != "") {
		$sWhere = "WHERE  presupuesto.codigoLinea = listalinea.codigoLinea
		AND presupuesto.codigoVendedor = vendedor.codigoVendedor AND (";
		for ($i = 0; $i < count($aColumns); $i++) {
			$sWhere .= $aColumns[$i] . " LIKE '%" . $q . "%' OR ";
		}
		$sWhere = substr_replace($sWhere, "", -3);
		$sWhere .= ')';
	}
	$sWhere .= " order by fechaPresupuesto ";
	include '../pagination.php'; //include pagination file
	//pagination variables
	$page = (isset($_REQUEST['page']) && !empty($_REQUEST['page'])) ? $_REQUEST['page'] : 1;
	$per_page = 10; //how much records you want to show
	$adjacents  = 4; //gap between pages after number of adjacents
	$offset = ($page - 1) * $per_page;
	//Count the total number of row in your table*/
	$count_query   = mysqli_query($con, "SELECT count(*) AS numrows FROM $sTable  $sWhere");
	$row = mysqli_fetch_array($count_query);
	$numrows = $row['numrows'];
	$total_pages = ceil($numrows / $per_page);
	$reload = '../../presupuestos.php';
	//main query to fetch the data
	$sql = "SELECT codigoPresupuesto, fechaPresupuesto, cantidadMesPresupuesto, presupuestoMes, cantidadPromos, 
	cantidadGarantias, cantidadTotal, status, vendedor.codigoVendedor, vendedor.nombreVendedor, listalinea.codigoLinea, 
	listalinea.nombreLinea FROM  $sTable $sWhere LIMIT $offset,$per_page";
	$query = mysqli_query($con, $sql);
	//loop through fetched data
	if ($numrows > 0) {

	?>
		<div class="table-responsive">
			<table id="registrosTable" class="table ">
				<tr class="info">

					<th>Fecha</th>
					<th>COD Vendedor</th>
					<th>Vendedor</th>
					<th>Cantidad Mes</th>
					<th>Presupuesto</th>
					<th>Cantidad Promos</th>
					<th>Cantidad Garantía</th>
					<th>Cantidad Total</th>
					<th>COD Linea</th>
					<th>Linea</th>
					<th>Acciones</th>
					

				</tr>
				<?php
				while ($row = mysqli_fetch_array($query)) {
					$id_presupuesto = $row['codigoPresupuesto'];
					$fecha_presupuesto = $row['fechaPresupuesto'];
					$cod_vendedor_presupuesto = $row['codigoVendedor'];
					$vendedor_presupuesto = $row['nombreVendedor'];
					$cantidad_mes_presupuesto = $row['cantidadMesPresupuesto'];
					$presupuesto_mes = $row['presupuestoMes'];
					$cantidad_promos_presupuesto = $row['cantidadPromos'];
					$cantidad_garantia_presupuesto = $row['cantidadGarantias'];
					$cantidad_total_presupuesto = $row['cantidadTotal'];
					$cod_linea_presupuesto = $row['codigoLinea'];
					$linea_presupuesto = $row['nombreLinea'];
					$status = $row['status'];


				?>

					<input type="hidden" value="<?php echo $fecha_presupuesto;?>"id="fecha_presupuesto<?php echo $id_presupuesto; ?>">  
					<input type="hidden" value="<?php echo $cod_vendedor_presupuesto;?>"id="cod_vendedor_presupuesto<?php echo $id_presupuesto; ?>">
					<input type="hidden" value="<?php echo $vendedor_presupuesto;?>"id="vendedor_presupuesto<?php echo $id_presupuesto; ?>"> 
					<input type="hidden" value="<?php echo $cantidad_mes_presupuesto;?>"id="cantidad_mes_presupuesto<?php echo $id_presupuesto; ?>">
					<input type="hidden" value="<?php echo $presupuesto_mes;?>"id="presupuesto_mes<?php echo $id_presupuesto; ?>">
					<input type="hidden" value="<?php echo $cantidad_promos_presupuesto;?>"id="cantidad_promos_presupuesto<?php echo $id_presupuesto; ?>"> 
					<input type="hidden" value="<?php echo $cantidad_garantia_presupuesto;?>"id="cantidad_garantia_presupuesto<?php echo $id_presupuesto; ?>"> 
					<input type="hidden" value="<?php echo $cantidad_total_presupuesto;?>"id="cod_linea_presupuesto<?php echo $id_presupuesto; ?>"> 
					<input type="hidden" value="<?php echo $cod_linea_presupuesto;?>"id="cod_linea_presupuesto<?php echo $id_presupuesto; ?>"> 
					<input type="hidden" value="<?php echo $linea_presupuesto;?>"id="linea_presupuesto<?php echo $id_presupuesto; ?>"> 
					<input type="hidden" value="<?php echo $status;?>"id="status<?php echo $id_presupuesto; ?>"> 
					<tr>
						<td><?php echo $fecha_presupuesto; ?></td>
						<td><?php echo $cod_vendedor_presupuesto; ?></td>
						<td><?php echo $vendedor_presupuesto; ?></td>
						<td><?php echo $cantidad_mes_presupuesto; ?></td>
						<td><?php echo $presupuesto_mes; ?></td>
						<td><?php echo $cantidad_promos_presupuesto; ?></td>
						<td><?php echo $cantidad_garantia_presupuesto; ?></td>
						<td><?php echo $cantidad_total_presupuesto; ?></td>
						<td><?php echo $cod_linea_presupuesto; ?></td>
						<td><?php echo $linea_presupuesto; ?></td>


						<td><span>
								<a href="#" title='Editar presupuesto' onclick="obtener_datos('<?php echo $id_presupuesto; ?>');" data-toggle="modal" data-target="#modPresupuesto"><i class="glyphicon glyphicon-edit"></i></a>
								<a href="#" title='Borrar presupuesto' onclick="eliminar('<?php echo $id_presupuesto; ?>')"><i class="glyphicon glyphicon-trash" style="color: red;"></i> </a>
							</span>
						</td>

					</tr>
				<?php
				}
				?>

			</table>
			<div class="paginacion">

				<?php
				echo paginate($reload, $page, $total_pages, $adjacents);
				?>

			</div>
		</div>
		<?php
	} else {
		if ($_GET['q'] != "") {
		?>
			<div class="alert alert-danger text-center" role="alert">
				No existen usuarios filtrados con el dato: <?php echo $_GET['q']; ?>
			</div>
<?php
		}
	}
}
?>
<script>
	function crearCookie(nombre, valor, dias) {
		var expira;
		if (dias) {
			var date = new Date();
			date.setTime(date.getTime() + (dias * 24 * 60 * 60 * 1000));
			expira = "; expires=" + date.toGMTString();
		} else {
			expira = "";
		}
		document.cookie = escape(nombre) + "=" + escape(valor) + expira + "; path=/";
	}
</script>