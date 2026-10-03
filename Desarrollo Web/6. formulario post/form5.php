<?php

$var = $_POST['var'];

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario 5</title>
</head>
<body>

    <h2>Token recibido correctamente</h2>

    <form method="POST">

        <input type="hidden" name="var" value="<?php echo $var; ?>">

        <button type="submit">Token Exit</button>

    </form>

</body>
</html>