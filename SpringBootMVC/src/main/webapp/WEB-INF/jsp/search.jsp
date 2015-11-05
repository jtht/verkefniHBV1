<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="is">
    <head>
        <meta charset="utf-8">
        <title>Searcharino</title>
    </head>
    <body>
        <form method="POST" action="/searchmedia" enctype="multipart/form-data" >
            <div>
                <label for="search">Search:</label>
                <input type="text" name="search" id="search">
            </div>
            <button>Submit</button>
        </form>
        <ul>
            <c:forEach var="mediaFile" items="${mediaFiles}">
                <li><c:out value="${mediaFile.getName()}"/></li>
                <li><c:out value="${mediaFile.getResource()}"/></li>
                <li><c:out value="${mediaFile.getTag()}"/></li>
                <li><c:out value="${mediaFile.getType()}"/></li>
                <li><a href=/media/<c:out value="${mediaFile.getName()}"/>>link</a></li>
            </c:forEach>
        </ul>
        <p><a href="/uploadmedia">upload media</a></p>
    </body>
</html>