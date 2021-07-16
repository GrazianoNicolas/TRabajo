<?php       
    require_once('inc/func/funciones.php');
    require_once('inc/func/conexionBaseDatos.php');
    $id_cat = ObtenerCategoria();
    $con = ConexionBaseDatos();
    $Resul_Pro = $con-> query(ConsultaProductos());
    $Resul_Cat = $con-> query(ConsultaCategoria());
?>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <script src="https://kit.fontawesome.com/e15e8c34af.js" crossorigin="anonymous"></script>
        <title>ZonaGamer_Inicio</title>
        <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="estilos/estilos.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    </head>
    <body>
    <header id="header"></header>
    <script src="JS/Header_index.js"> </script>
        <main>
            <section class="container seccion">
                <h1 class="mt-md-3  mt-3 text-titulo">Productos</h1>
                <div class="izquierda">
                    <h2 class="mt-md-3 mt-3">Categorias</h1>
                    <?php
                        while ($categoria = mysqli_fetch_array($Resul_Cat)){
                            echo '<a href="index.php?id_categoria='.$categoria['id_Categoria'].'" >' . $categoria['categoria']. '</a>';
                            echo '<br>';
                        }
                    ?>
                </div>
                <div class="row">
                    <?php while ($producto = mysqli_fetch_array($Resul_Pro)) {
                        if ($producto['id_Categoria'] == $id_cat  or $id_cat == 1) {
                        ?>
                            <div class="col-lg-4 col-md-6 col-12 mb-3">
                                <div class="card">
                                    <img class="card-img-top" src=<?php print( $producto['foto']) ?> alt="">
                                    <div class="card-body">
                                        <h2 class="h4 card-title"><?php print($producto['nombre']) ?></h2>
                                        <p class="card-text">
                                            <p>Descripcion:<?php $tex = $producto['descripcion'];
                                                            echo substr($tex, 0, 20); ?></p>
                                            <p>Precio: $<?php print($producto['precio']) ?></p>
                                        </p>
                                    </div>
                                    <div class="card-footer">
                                        <a href="paginas/detalleproducto.php?variable=<?php echo $producto['id_Producto']; ?>">
                                            <p class="btn btn-gris">Mas detalles</p>
                                        </a>
                                    </div>
                                </div>
                            </div>
                    <?php }
                    }
                    ?>
                </div>
            </section>
        </main>
        <footer id="piepagina"></footer>
        <script src="JS/footer.js"></script>
        <script src="lib/jquery/jquery-3.3.1.min.js"></script>
        <script src="lib/bootstrap/js/bootstrap.min.js"></script>
    </body>

</html>

