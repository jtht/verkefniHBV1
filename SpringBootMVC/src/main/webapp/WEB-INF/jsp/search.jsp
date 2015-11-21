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
                <h1>Search</h1>
                <p></p>
                <form method="POST" action="/searchmedia" enctype="multipart/form-data" >
                    <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8 text-center">
                        <div class="input-group">
                          <input type="text" class="form-control" placeholder="Search for one tag...">
                          <span class="input-group-btn">
                            <button class="btn btn-primary" name="search" type="button">Go!</button>
                          </span>
                        </div>
                    </div>
                    </div>
                </form>
                <p></p>
                <ul>
                    <c:forEach var="mediaFile" items="${mediaFiles}">
                        <li><c:out value="${mediaFile.getName()}"/></li>
                        <li><c:out value="${mediaFile.getResource()}"/></li>
                        <li><c:out value="${mediaFile.getTag()}"/></li>
                        <li><c:out value="${mediaFile.getType()}"/></li>
                        <li><a href=/media/<c:out value="${mediaFile.getName()}"/>>link</a></li>
                    </c:forEach>
                </ul>
                <p><a href="/uploadmedia" class="btn btn-primary" role="button">Upload Media</a></p>
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