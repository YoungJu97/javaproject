<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Travel</title>
    <style>
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            background-color: #f8f8f8;
            color: #333;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        #content-wrapper {
            max-width: 600px;
            width: 100%;
        }

        h1 {
            color: #4285f4;
            text-align: center;
        }

        div {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 20px;
            margin: 10px 0;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #4285f4;
        }

        p {
            margin: 10px 0;
        }

        img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            margin-top: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            /* Additional styles for controlling the size */
            width: 100%; /* Set your preferred width */
            max-height: 400px; /* Set your preferred maximum height */
            transition: transform 0.3s; /* Add a smooth transition effect */
        }

        img:hover {
            transform: scale(1.1); /* Increase the size on hover */
        }

        input {
            width: 70%;
            padding: 10px;
            box-sizing: border-box;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        button {
            width: 30%;
            padding: 10px;
            box-sizing: border-box;
            border-radius: 5px;
            margin-bottom: 20px;
            background-color: #4285f4;
            color: #fff;
            cursor: pointer;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #4285f4;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div id="content-wrapper">
        <h1>Travel Introduction</h1>
        <input type="text" placeholder="Search" id="searchinput">
        <button onclick="searchContent()">Search</button>

        <c:forEach var="item" items="${apiResult}">
            <div class="travel">
                <h2>${item.get("title").asText()}</h2>
                <p>Address: ${item.get("addr1").asText()}</p>
                <p>Telephone: ${item.get("tel").asText()}</p>
                <p>Distance: ${item.get("dist").asText()} meters</p>
                <img src="${item.get("firstimage").asText()}" alt="${item.get("title").asText()}">
            </div>
        </c:forEach>

        <!-- Add a link to the next page using tripUrl -->
        <a href="${tripUrl}">Next Page</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        function searchContent() {
            var input, filter, sections, section, title, i, txtValue;
            input = $("#searchinput");
            filter = input.val().toUpperCase();
            sections = $("div.travel");

            sections.each(function () {
                section = $(this);
                title = section.find("h2"); // Assuming the title is inside an h2 element
                txtValue = title.text() || title.text().toUpperCase();

                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    section.show();
                } else {
                    section.hide();
                }
            });
        }
    </script>
</body>
</html>
