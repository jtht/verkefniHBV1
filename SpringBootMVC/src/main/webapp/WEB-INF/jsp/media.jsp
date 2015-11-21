<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="is">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Icelandic Online</title>
        <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,700'>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
    </head>
    <body>
        <main class="container">
            <div class="container-fluid">
                <div class="col-md-2"></div>
                <div class="col-md-8 text-center">
                <h1>Media Upload</h1>
                <img src="/${image}">
                <div id="links">   
                    <p></p>
                    <a href="/uploadmedia" class="btn btn-primary">Upload Media</a>
                    <a href="/searchmedia" class="btn btn-primary">Search Media</a>
                </div>
                </div>
                </div>
            </div>
        </main>
        </script>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>