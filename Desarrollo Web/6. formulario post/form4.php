<?php

$var = $_POST['var'];

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" href="style.css">
    <meta charset="UTF-8">
    <title>Formulario 4</title>
</head>
<body>
<h1>formulario 4</h1>
    <form action="form5.php" method="POST">

        <input type="hidden" name="var" value="<?php echo $var; ?>">

        <button type="submit">></button>

    </form>

</body>
</html>