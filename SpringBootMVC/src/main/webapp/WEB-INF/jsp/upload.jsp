<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Upload</title>
    </head>
    <body>
        <div class="container">
            <div class="col-md-4"></div>
            <div class="col-md-4 text-center">
                <h1>Upload media</h1>
                <form method="POST" action="/uploadmedia" enctype="multipart/form-data" id="uploadForm">
                    <div>File:<input type="file" name="files" id="files" multiple></div>
                    <ul id="fileInfo"></ul>
                    <button>Submit</button>
                </form>
                <p><a href="/searchmedia">search media</a></p>
            </div>
            <div class="col-md-4"></div>
        </div>

        <script>
            var storedFiles = [];
            var types = [];
            var ul = document.getElementById('fileInfo');

            document.addEventListener("DOMContentLoaded", init, false);

            function init() {
                document.getElementById('files').addEventListener('change', handleFileSelect, false);
                document.getElementById('uploadForm').addEventListener('submit', handleForm, false);
            }

            function handleFileSelect(e) {
                var files = Array.prototype.slice.call(e.target.files);
                files.forEach(function(file) {
                    var div = document.createElement('div');
                    var span = document.createElement('span');
                    var li = document.createElement('li');

                    span.addEventListener('click', removeFile, false);
                    var index = storedFiles.length;
                    div.setAttribute('data-index', index);

                    div.appendChild(span);
                    div.appendChild(li);
                    div.appendChild(makeTagInput(index));
                    ul.appendChild(div);

                    var name = file.name;
                    var dotIndex = name.lastIndexOf(".");
                    var type = dotIndex === -1 ? "jpg" : name.substring(dotIndex);
                    li.textContent = name;
                    span.textContent = 'X';
                    types.push(type);
                    storedFiles.push(file);
                });
            }

            function makeTagInput(index) {
                var div = document.createElement('div');
                var span = document.createElement('span');
                var input = document.createElement('input');

                span.textContent = 'Tags: ';
                input.setAttribute('type', 'text');
                input.setAttribute('class', 'tags');
                input.setAttribute('data-index', index);

                div.appendChild(span);
                div.appendChild(input);

                return div;
            }

            function removeFile(e) {
                var div = e.target.parentNode;
                var index = div.dataset.index;
                delete storedFiles[index];
                delete types[index];

                div.parentNode.removeChild(div);
            }

            function tagsCmp(a,b) {
                return parseInt(a.dataset.index) - parseInt(b.dataset.index);
            }

            function handleForm(e) {
                e.preventDefault();
                var data = new FormData();

                var tags = Array.prototype.slice.call(document.getElementsByClassName('tags')).sort(tagsCmp);
                for (var k= 0; k < tags.length; k++) {
                    data.append('tags[]', tags[k].value);
                }

                storedFiles = storedFiles.filter(Boolean);
                for(var i=0, len=storedFiles.length; i<len; i++) {
                    data.append('files[]', storedFiles[i]);
                }

                types = types.filter(Boolean);
                for(var i=0, len=types.length; i<len; i++) {
                    data.append('types[]', types[i]);
                }

                // reset for new uploads
                storedFiles = [];
                types = [];
                ul.textContent = "";

                // Breyta þessu
                data.append('type', 'image');

                var xmlhr = new XMLHttpRequest();
                xmlhr.open('POST', '/uploadmedia', true);

                xmlhr.onload = function(e) {
                    if(this.status == 200) {
                        console.log('success!');
                    } else {
                        console.log('no go');
                    }
                }

                xmlhr.send(data);
            }
        </script>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
