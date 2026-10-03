<?php

$var = $_POST['var'];

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" href="style.css">
    <meta charset="UTF-8">
    <title>Formulario 5</title>
</head>
<body>
<div class="container">

    <h2>Formulario #5</h2>

    <p>Token SHA-256 generado:</p>

    <div class="token">
        <?php echo $var; ?>
    </div>

</div>
</body>
</html>