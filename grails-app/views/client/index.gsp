<%--
  Created by IntelliJ IDEA.
  User: mmorelli
  Date: 2019-04-28
  Time: 17:13
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <script src="/assets/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="/assets/bootstrap.css?compile=false">
    <script src="/assets/formValidator.js"></script>
    <script src="/assets/index.js"></script>
    <link rel="stylesheet" href="/assets/index-styles.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <title></title>


    <script type="application/javascript">




        function buscarAgencias() {
            $('#MisAgencias').text("")

            var dat = $('#AgenciaForm').serializeArray()
            $.ajax({
                type: "GET",
                dataType: "json",
                url: "/Client/getAgencias",
                data: $("#AgenciaForm").serializeArray(),
                success: function (response) {
                    console.log(response)
                    $('#agencias_list').append('<h2>Lista de Agencias </h2>')
                    $.each(response, function (i, agencia) {
                        $agencia = $('<a>', {
                            id: agencia.agency_code,
                            text: agencia.description,
                            class: "list-group-agencia",
                            href: "#"
                        });
                        $agencia.append($('<i>', {
                            style: "font-size:32px; margin-left: 10px",
                            class: "fa fa-thumbs-down pull-right",
                            onclick: "dislike(this.parentNode.id)"
                        }));
                        $agencia.append($('<i>', {
                            style: "font-size:32px;",
                            class: "fa fa-thumbs-up pull-right",
                            onclick: "like(this.parentNode.id)"
                        }));
                        $('#MisAgencias').append($agencia);
                    });
                }
            });
        }

        function like(id) {
            alert("Me gusta la agencia: "+id);
        }


        function dislike(id) {
            alert("No me gusta la agencia: "+id);
        }

    </script>

</head>

<body>

<div class="col-md-4 mb-3 md-form">
    <form class="form-group" name="AgenciaForm" id="AgenciaForm" novalidate class="needs-validation">
        </br>
        <div class="form-group">
            <input type="number" class="form-control" name="latitud" id="latitud" min="-90" max="90"  placeholder="Latitud" required>
        </div>
        <div class="form-group">
            <input type="number" class="form-control" name="longitud" id="longitud" min="-180" max="180" placeholder="Longitud" required>
               </div>
        <div class="form-group">
            <input type="number" class="form-control" name="radio" id="radio" min="0" max="1000" placeholder="Radio" required>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="site_id" id="site_id" placeholder="ID Sitio" required>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="payment_methods" id="payment_methods" placeholder="Metodo de Pago" required>
        </div>
        <div class="form-group">
            <select class="form-control" id="criterioOrden">
                <label for="criterioOrden">Ordenar por</label>
                <option value="Distance">Distancia</option>
                <option value="Address line">Dirección</option>
                <option value="Agency Code">Código Agencia</option>
            </select>
        </div>
        <button class="btn btn-primary" type="submit" onclick="buscarAgencias()">Buscar Agencias</button>
    </form>

</div>
<div class="container-fluid">
    <div class="list-group" id="MisAgencias">
    </div>

</div>

</body>
</html>