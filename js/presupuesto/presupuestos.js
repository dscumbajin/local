		$(document).ready(function() {
		    load(1);
		});

		function load(page) {
		    var q = $("#q").val();
		    $("#loader").fadeIn('slow');
		    $.ajax({
		        url: './ajax/presupuesto/buscar_presupuestos.php?action=ajax&page=' + page + '&q=' + q,
		        beforeSend: function(objeto) {
		            $('#loader').html('<img src="./img/ajax-loader.gif"> Cargando...');
		        },
		        success: function(data) {
		            $(".outer_div").html(data).fadeIn('slow');
		            $('#loader').html('');

		        }
		    })
		}

		function eliminar(id) {
		    var q = $("#q").val();
		    if (confirm("Realmente deseas eliminar el cliente")) {
		        $.ajax({
		            type: "GET",
		            url: "./ajax/presupuesto/buscar_presupuestos.php",
		            data: "id=" + id,
		            "q": q,
		            beforeSend: function(objeto) {
		                $("#resultados").html("Mensaje: Cargando...");
		            },
		            success: function(datos) {
		                $("#resultados").html(datos);
		                load(1);
		            }
		        });
		    }
		}

		$("#guardar_presupuesto").submit(function(event) {
		    $('#guardar_datos').attr("disabled", true);

		    var parametros = $(this).serialize();
		    $.ajax({
		        type: "POST",
		        url: "ajax/presupuesto/nuevo_presupuesto.php",
		        data: parametros,
		        beforeSend: function(objeto) {
		            $("#resultados_ajax").html("Mensaje: Cargando...");
		        },
		        success: function(datos) {
		            $("#resultados_ajax").html(datos);
		            $('#guardar_datos').attr("disabled", false);
		            load(1);
		        }
		    });
		    event.preventDefault();
		})

		$("#editar_presupuesto").submit(function(event) {
		    $('#actualizar_datos').attr("disabled", true);

		    var parametros = $(this).serialize();
		    $.ajax({
		        type: "POST",
		        url: "ajax/presupuesto/editar_presupuesto.php",
		        data: parametros,
		        beforeSend: function(objeto) {
		            $("#resultados_ajax2").html("Mensaje: Cargando...");
		        },
		        success: function(datos) {
		            $("#resultados_ajax2").html(datos);
		            $('#actualizar_datos').attr("disabled", false);
		            load(1);
		        }
		    });
		    event.preventDefault();
		})

		function obtener_datos(id) {

			var fecha_presupuesto  = $("#fecha_presupuesto" + id).val();
			var cod_vendedor_presupuesto  = $("#cod_vendedor_presupuesto" + id).val();
			var cantidad_mes_presupuesto  = $("#cantidad_mes_presupuesto" + id).val();
			var presupuesto_mes  = $("#presupuesto_mes" + id).val();
			var cantidad_promos_presupuesto  = $("#cantidad_promos_presupuesto" + id).val();
			var cantidad_garantia_presupuesto  = $("#cantidad_garantia_presupuesto" + id).val();
			var cod_linea_presupuesto  = $("#cod_linea_presupuesto" + id).val();
			var status = $("#status" + id).val();
			

		    $("#mod_fecha_presupuesto").val(fecha_presupuesto);
		    $("#mod_cod_vendedor_presupuesto").val(cod_vendedor_presupuesto);
			$("#mod_cantidad_mes_presupuesto").val(cantidad_mes_presupuesto);
		    $("#mod_presupuesto_mes").val(presupuesto_mes);
			$("#mod_cantidad_promos_presupuesto").val(cantidad_promos_presupuesto);
			$("#mod_cantidad_garantia_presupuesto").val(cantidad_garantia_presupuesto);
			$("#mod_cod_linea_presupuesto").val(cod_linea_presupuesto);
			$("#mod_status").val(status);
		    $("#mod_id").val(id);

		}