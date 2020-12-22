	<?php
	if (isset($con)) {
	?>
		<!-- Modal -->
		<div class="modal fade" id="nuevoPresupuesto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Agregar presupuesto</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" method="post" id="guardar_presupuesto" name="guardar_presupuesto">
							<div id="resultados_ajax"></div>

							<!-- Date -->
							<div class="form-group">
								<label for="fecha_presupuesto" class="col-sm-3 control-label">Fecha</label>
								<div class=" col-sm-8 input-group date" data-provide="datepicker">
									<input type="text" class="form-control" id="fecha_presupuesto" name="fecha_presupuesto" placeholder="yyyy-mm-dd">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="cantidad_mes_presupuesto" class="col-sm-3 control-label">Cantidad Mes</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="cantidad_mes_presupuesto" name="cantidad_mes_presupuesto" require placeholder="0.0">
								</div>
							</div>
							
							<div class="form-group">
								<label for="presupuesto_mes" class="col-sm-3 control-label">Presupuesto Mes</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="presupuesto_mes" name="presupuesto_mes" require placeholder="0.0">
								</div>
							</div>

							<div class="form-group">
								<label for="cantidad_promos_presupuesto" class="col-sm-3 control-label">Cantidad Promos</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="cantidad_promos_presupuesto" name="cantidad_promos_presupuesto" require placeholder="0.0">
								</div>
							</div>

							<div class="form-group">
								<label for="cantidad_garantia_presupuesto" class="col-sm-3 control-label">Cantidad Garantías</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="cantidad_garantia_presupuesto" name="cantidad_garantia_presupuesto" require placeholder="0.0">
								</div>
							</div>

							<div class="form-group">
								<label for="codigoVendedor" class="col-sm-3 control-label">Vendedor</label>
								<div class="col-sm-8">
									<select class="form-control" id="codigoVendedor" name="codigoVendedor" required>
										<?php
										try {
											$sql = 'SELECT * FROM vendedor';

											$resultado = $con->query($sql);
											while ($vendedor = $resultado->fetch_assoc()) { ?>
												<option value="<?php echo $vendedor['codigoVendedor']; ?>">
													<?php echo $vendedor['codigoVendedor'] . " - " . $vendedor['nombreVendedor']; ?></option>
										<?php }
										} catch (Exception $e) {
											echo "Error: " . $e->getMessage();
										}
										?>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="codigoLinea" class="col-sm-3 control-label">Linea de negocio</label>
								<div class="col-sm-8">
									<select class="form-control" id="codigoLinea" name="codigoLinea" required>
										<?php
										try {
											$sql = 'SELECT * FROM listalinea';

											$resultado = $con->query($sql);
											while ($listalinea = $resultado->fetch_assoc()) { ?>
												<option value="<?php echo $listalinea['codigoLinea']; ?>">
													<?php echo $listalinea['codigoLinea'] . " - " . $listalinea['nombreLinea']; ?></option>
										<?php }
										} catch (Exception $e) {
											echo "Error: " . $e->getMessage();
										}
										?>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="estado" class="col-sm-3 control-label">Estado</label>
								<div class="col-sm-8">
									<select class="form-control sel" id="estado" name="estado" required>
										<option value="">-- Selecciona estado --</option>
										<option value="1" selected>Activo</option>
										<option value="0">Inactivo</option>
									</select>
								</div>
							</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
						<button type="submit" class="btn btn-primary" id="guardar_datos">Guardar datos</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	<?php
	}
	?>
