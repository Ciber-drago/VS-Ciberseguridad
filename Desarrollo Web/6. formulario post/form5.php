<?php

$var = $_POST['var'];

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario #5</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<div class="container">

    <h1>Formulario #5</h1>

    <p>Token SHA-256 final:</p>

    <div class="token">
        <?php echo $var; ?>
    </div>

</div>

</body>
</html>