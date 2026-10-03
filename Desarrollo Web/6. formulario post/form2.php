<?php

$var = $_POST['var'];

if ($var == "crear_token") {
    $token = hash('sha256', $var);
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario 2</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <div class="container">

        <h2>Formulario #2</h2>

        <p>Token SHA-256 generado:</p>

        <div class="token">
            <?php echo $token; ?>
        </div>

        <br>

        <form action="form3.php" method="POST">

            <input type="hidden" name="var" value="<?php echo $token; ?>">

            <button type="submit">></button>

        </form>

    </div>

</body>
</html>