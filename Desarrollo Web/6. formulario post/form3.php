<?php

$var = $_POST['var'];

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" href="style.css">
    <meta charset="UTF-8">
    <title>Formulario 3</title>
</head>
<body>
<h1>formulario 3</h1>
    <form action="form4.php" method="POST">

        <input type="hidden" name="var" value="<?php echo $var; ?>">

        <button type="submit">></button>

    </form>

</body>
</html>