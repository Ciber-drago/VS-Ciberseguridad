<?php

$var = $_POST['var'];

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario #3</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<div class="container">

    <h1>Formulario #3</h1>

    <p>
        Token recibido correctamente.
    </p>

    <form action="form4.php" method="POST">

        <input type="hidden" name="var" value="<?php echo $var; ?>">

        <button type="submit">></button>

    </form>

</div>

</body>
</html>