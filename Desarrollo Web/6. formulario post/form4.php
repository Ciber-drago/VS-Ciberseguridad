<?php

$var = $_POST['var'];

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario 4</title>
</head>
<body>

    <form action="form5.php" method="POST">

        <input type="hidden" name="var" value="<?php echo $var; ?>">

        <button type="submit">></button>

    </form>

</body>
</html>