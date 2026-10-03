<?php

$var = $_POST['var'];

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario #4</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<div class="container">

    <h1>Formulario #4</h1>

    <p>
        El token continúa al siguiente formulario.
    </p>

    <form action="form5.php" method="POST">

        <input type="hidden" name="var" value="<?php echo $var; ?>">

        <button type="submit">></button>

    </form>

</div>

</body>
</html>