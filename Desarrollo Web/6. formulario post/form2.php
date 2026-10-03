<?php

$var = $_POST['var'];

$token = hash('sha256', $var);

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" href="style.css">
    <meta charset="UTF-8">
    <title>Formulario 2</title>
</head>
<body>

    <form action="form3.php" method="POST">

        <input type="hidden" name="var" value="<?php echo $token; ?>">

        <button type="submit">></button>

    </form>

</body>
</html>