#! /bin/bash
apt update
apt -y install apache2
cat <<EOF > /var/www/html/index.html

<html>
<body>

<h1> Sklep w budowie. Wkrotce otwarcie!</h1>

<h2 style="color:blue;">Learning (especially cloud) never ends...</h2>

<img src="https://upload.wikimedia.org/wikipedia/commons/6/6b/Sierpinski_zoom_2.gif" alt="Tutaj powinien znajdowac sie Trojkat Sierpinskiego" style="width:400px;height:300px;">

</body>
</html>