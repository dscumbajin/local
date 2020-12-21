	<?php
	if (isset($con)) {
	?>
		<!-- Modal -->
		<div class="modal fade" id="modPresupuesto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel"><i class='glyphicon glyphicon-edit'></i> Editar cliente</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" method="post" id="editar_presupuesto" name="editar_presupuesto">
							<div id="resultados_ajax2"></div>
							<input type="hidden" name="mod_id" id="mod_id">
							<!-- Date -->
							<div class="form-group">
								<label for="mod_fecha_presupuesto" class="col-sm-3 control-label">Fecha</label>
								<div class=" col-sm-8 input-group date" data-provide="datepicker">
									<input type="text" class="form-control" id="mod_fecha_presupuesto" name="mod_fecha_presupuesto" placeholder="yyyy-mm-dd">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-th"></span>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="mod_cantidad_mes_presupuesto" class="col-sm-3 control-label">Cantidad Mes</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="mod_cantidad_mes_presupuesto" name="mod_cantidad_mes_presupuesto" require placeholder="0.0">
								</div>
							</div>
							
							<div class="form-group">
								<label for="mod_presupuesto_mes" class="col-sm-3 control-label">Presupuesto Mes</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="mod_presupuesto_mes" name="mod_presupuesto_mes" require placeholder="0.0">
								</div>
							</div>

							<div class="form-group">
								<label for="mod_cantidad_promos_presupuesto" class="col-sm-3 control-label">Cantidad Promos</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="mod_cantidad_promos_presupuesto" name="mod_cantidad_promos_presupuesto" require placeholder="0.0">
								</div>
							</div>

							<div class="form-group">
								<label for="mod_cantidad_garantia_presupuesto" class="col-sm-3 control-label">Cantidad Garantías</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" id="mod_cantidad_garantia_presupuesto" name="mod_cantidad_garantia_presupuesto" require placeholder="0.0">
								</div>
							</div>

						

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
						<button type="submit" class="btn btn-primary" id="actualizar_datos">Actualizar datos</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	<?php
	}
	?>