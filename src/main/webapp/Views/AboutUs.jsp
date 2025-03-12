<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Roboto', sans-serif;
            background: #f5f5f5;
            line-height: 1.6;
            color: #333;
        }
        header {
            background: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .about-section {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 40px;
        }
        .about-text {
            flex: 1;
            max-width: 600px;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: left;
        }
        .about-text h2 {
            font-size: 2.5rem;
            color: #333;
        }
        .about-text p {
            font-size: 1.1rem;
            color: #555;
            margin: 20px 0;
        }
        .about-text ul {
            list-style-type: none;
            padding-left: 0;
        }
        .about-text ul li {
            font-size: 1rem;
            color: #555;
            margin: 10px 0;
        }
        .about-images {
            display: flex;
            gap: 10px;
        }
        .about-images img {
            width: 250px;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        footer {
            background: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
            margin-top: 60px;
        }
        @media (max-width: 768px) {
            .about-section {
                flex-direction: column;
                align-items: center;
            }
            .about-images {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>

    <header>
        <h1>About Us</h1>
    </header>

    <div class="container">
        <section class="about-section">
            <div class="about-text">
                <h2>A New Way For Working For Many Of Professionals.</h2>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer.</p>
                <p>It took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
                <h3>Our Key Features:</h3>
                <ul>
                    <li>Innovative Workflows</li>
                    <li>Scalable Solutions</li>
                    <li>Easy-to-use Interface</li>
                    <li>Fast Data Processing</li>
                    <li>24/7 Customer Support</li>
                </ul>
            </div>
            <div class="about-images">
                <img src="path-to-your-image1.jpg" alt="Image 1">
                <img src="path-to-your-image2.jpg" alt="Image 2">
                <img src="path-to-your-image3.jpg" alt="Image 3">
            </div>
        </section>
    </div>

    <footer>
        <p>&copy; 2025 Your Company Name. All rights reserved.</p>
    </footer>

</body>
</html>
