<%@page import="Dao.Crud_Coach"%>
<%@page import="Dao.Crud_Times"%>
<%@page import="Dao.Crud_Athele"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Dao.Crud_Times"%>
<%@page import="Dao.Crud_Athele"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <script src="GraficasJS/Charts JS2/Chart.bundle.js"></script>
        <script src="GraficasJS/Charts JS2/utils.js"></script>
        <script src="GraficasJS/Jquery-3.3.1.js"></script>
        <script src="GraficasJS/Graficas.js"></script>

        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="./assets/img/kit/free/favicon.png">
        <link rel="icon" href="./assets/img/kit/free/favicon.png">
        <title>
            Sports Time - Gráficas (Coach)
        </title>
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <link rel="stylesheet" href="./assets/css/material-kit.css?v=2.0.2">
        <link rel="stylesheet" href="./assets/css/personalizar.css">

        <style>
            .caja{
                margin: auto;
                max-width: 250px;
                padding: 20px;
                border: 1px solid #BDBDBD;
            }
            .caja select{
                width: 100%;
                font-size: 16px;
                padding: 5px;
            }
            .resultados{
                margin: auto;
                margin-top: 40px;
                width: 1000px;
            }
        </style>

        <script>
            $(document).ready(function () {
                $('#sesionclose').click(function (event) {
                    $.ajax({
                        url: "Coach_Servlet",
                        data: {Temp: "close"},
                        type: "POST",
                        success: function (respuesta) {
                            if (respuesta.trim() == "close") {
                                window.location.replace("Login.jsp");
                            }


                        }
                    });
                });
            });

        </script>

        <script>
            $(document).ready(function () {
                $('#volver').click(function (event) {
                    window.location.replace("uniquegraph.jsp");
                    $.ajax({
                        success: function (respuesta) {
                        }
                    });
                });
            });
        </script>

        <script>
            $(document).ready(function () {
                $('#perfil').click(function (event) {
                    window.location.replace("Athlete.jsp");
                    $.ajax({
                        success: function (respuesta) {
                        }
                    });
                });
            });
        </script>

        <script>

            <%
                    Crud_Coach crr = new Crud_Coach();
                    HttpSession misession1 = request.getSession(true);
                    String h = String.valueOf(misession1.getAttribute("v"));
                    int identifiquer = Integer.parseInt(h);
                    String nomDep = crr.findAll().get(identifiquer).getName() + " " + crr.findAll().get(identifiquer).getLastname();

            %>

            $(document).ready(FiltroFecha2('<%=nomDep%>'));
        </script>

    </head>

    <body class="signup-page" style="background-color: #CEEDFF;">

    <center>
        <div class="container">
            <div class="navbar-translate">
                <center>
                    <div class="brand">
                        <a class="navbar-brand" href="./Login.jsp"> <img src="assets/img/LOGORes.png" alt="Sports Time" width=80% height=80%> </a>
                    </div>
                </center>
            </div>
        </div>
    </center>

    <div>
        <div style="margin-top: 10px;">
            <center>
                <a style="display:inline-block;margin-right:5px;" class="nav-link" rel="tooltip" title="" data-placement="bottom" href="https://twitter.com/SportsTimeUsSA" target="_blank" data-original-title="Síguenos en Twitter">
                    <i class="fa fa-twitter"></i>
                </a>
                <a style="display:inline-block;margin-right:5px;" class="nav-link" rel="tooltip" title="" data-placement="bottom" href="https://www.facebook.com/Sports-Time-448388048915031/" target="_blank" data-original-title="Síguenos en Facebook">
                    <i class="fa fa-facebook-square"></i>
                </a>
                <a style="display:inline-block;" class="nav-link" rel="tooltip" title="" data-placement="bottom" href="https://www.instagram.com/sports_time_usa/" target="_blank" data-original-title="Síguenos en Instagram">
                    <i class="fa fa-instagram"></i>
                </a>
            </center>
        </div>
        <br>
        <center>
            <div style="margin-bottom: 10px;">
                <a style="display:inline-block;margin-right:5px;" class="nav-link" rel="tooltip" title="" data-placement="bottom" href="./Coach.jsp" data-original-title="Perfil">
                    <i class="material-icons">face</i>
                </a>
                <input style="display:inline-block;" style="margin-bottom: 20px;" id="sesionclose" type="submit" value="Cerrar Sesión" class="btn btn-info btn-round">
            </div>
        </center>
    </div>

    <br>
    <div class="page-header">
        <div class="profile-content">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 ml-auto mr-auto">
                        <div class="card card-signup">

                            <center>
                                <div class="profile">

                                    <h2 class="card-title text-center">Gráficas de Rendimiento </h2>
                                    <br>
                                </div>
                            </center>
                            <div class="card-body">
                                <div id="TAblaJQ">
                                    <center>
                                        <div style="width:100px; height: 50px">
                                            <SELECT class="form-control" name="FehcasF" SIZE="1" id="FehcasF" onchange="FiltroEstilos('<%=nomDep%>')" ></SELECT>
                                            <SELECT class="form-control" name="EstilosF" SIZE="1" id="EstilosF" onchange="FiltroDistancia()"></SELECT>
                                            <SELECT class="form-control" name="DistaciaF" SIZE="1" id="DistaciaF" onchange="DatosFiltro2()"></SELECT>
                                        </div>
                                    </center>
                                    <br><br><br>
                                    <div id="canvas-holder1">
                                        <canvas id="chart2"></canvas>
                                    </div>
                                </div>

                                <br>
                                <center>
                                    <div>
                                        <button style="display:inline-block;margin-right:5px;" class="btn btn-info btn-round"onclick="toggleSmooth(this)">Linealizar Gráfica</button>
                                        <a style="display:inline-block;margin-right:5px;" href="./Coach.jsp" class="btn btn-info btn-round">Cancelar</a>
                                    </div>
                                </center>

                                <br><br><br><br>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>


    <footer class="footer" style="background-color: #CEEDFF;">
        <div class="container">
            <br>
            <center>
                &copy;
                <script>
                    document.write(new Date().getFullYear())
                </script>, Hecho por Sara Chamseddine, Juan Camilo Botonero, Sebastián Rojas, Diego León, Mario Bolaños
            </center>
        </div>
    </footer>



    <!--   Core JS Files   -->
    <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
    <script src="./assets/js/core/jquery.min.js"></script>
    <script src="./assets/js/core/popper.min.js"></script>
    <script src="./assets/js/bootstrap-material-design.js"></script>
    <!--  Plugin for Date Time Picker and Full Calendar Plugin  -->
    <script src="./assets/js/plugins/moment.min.js"></script>
    <!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
    <script src="./assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
    <!--	Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
    <script src="./assets/js/plugins/nouislider.min.js"></script>
    <!-- Material Kit Core initialisations of plugins and Bootstrap Material Design Library -->
    <script src="./assets/js/material-kit.js?v=2.0.2"></script>
    <!-- Fixed Sidebar Nav - js With initialisations For Demo Purpose, Don't Include it in your project -->
    <script src="./assets/assets-for-demo/js/material-kit-demo.js"></script>



</body>

</html>
