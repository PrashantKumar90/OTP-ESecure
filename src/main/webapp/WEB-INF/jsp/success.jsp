<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful - SecureOTP</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #4361ee;
            --primary-dark: #3a56d4;
            --secondary: #7209b7;
            --accent: #f72585;
            --light: #f8f9fa;
            --dark: #212529;
            --success: #4cc9f0;
            --gradient: linear-gradient(135deg, var(--primary), var(--secondary));
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #f5f7ff 0%, #e3e9ff 100%);
            color: var(--dark);
            line-height: 1.6;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }
        
        body::before {
            content: '';
            position: absolute;
            width: 500px;
            height: 500px;
            border-radius: 50%;
            background: linear-gradient(135deg, rgba(67, 97, 238, 0.1) 0%, rgba(114, 9, 183, 0.1) 100%);
            top: -250px;
            right: -150px;
            z-index: -1;
        }
        
        body::after {
            content: '';
            position: absolute;
            width: 300px;
            height: 300px;
            border-radius: 50%;
            background: linear-gradient(135deg, rgba(247, 37, 133, 0.1) 0%, rgba(76, 201, 240, 0.1) 100%);
            bottom: -150px;
            left: -100px;
            z-index: -1;
        }
        
        .success-card {
            background: white;
            border-radius: 20px;
            padding: 50px 40px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.1);
            text-align: center;
            position: relative;
            overflow: hidden;
            max-width: 500px;
            width: 90%;
            animation: cardEntrance 0.8s ease-out;
        }
        
        .success-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: var(--gradient);
        }
        
        .success-icon {
            width: 100px;
            height: 100px;
            background: var(--gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 30px;
            color: white;
            font-size: 40px;
            animation: iconBounce 1s ease-in-out;
            box-shadow: 0 10px 30px rgba(67, 97, 238, 0.3);
        }
        
        .success-title {
            font-size: 2rem;
            margin-bottom: 15px;
            background: var(--gradient);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }
        
        .success-message {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 30px;
        }
        
        .button-container {
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-wrap: wrap;
        }
        
        .btn {
            padding: 12px 30px;
            border-radius: 30px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            font-size: 1rem;
        }
        
        .btn-primary {
            background: var(--gradient);
            color: white;
        }
        
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(67, 97, 238, 0.3);
        }
        
        .btn-outline {
            background: transparent;
            border: 2px solid var(--primary);
            color: var(--primary);
        }
        
        .btn-outline:hover {
            background: var(--primary);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(67, 97, 238, 0.2);
        }
        
        @keyframes cardEntrance {
            0% {
                opacity: 0;
                transform: translateY(30px) scale(0.9);
            }
            100% {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }
        
        @keyframes iconBounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-15px);
            }
            60% {
                transform: translateY(-7px);
            }
        }
        
        /* Responsive Design */
        @media (max-width: 480px) {
            .success-card {
                padding: 30px 20px;
            }
            
            .success-title {
                font-size: 1.8rem;
            }
            
            .button-container {
                flex-direction: column;
                align-items: center;
            }
            
            .btn {
                width: 100%;
                max-width: 250px;
            }
        }
    </style>
</head>
<body>
    <div class="success-card">
        <div class="success-icon">
            <i class="fas fa-check"></i>
        </div>
        
        <h1 class="success-title">Registration Successful!</h1>
        
        <p class="success-message">
            Your account has been created successfully. You can now access your dashboard.
        </p>
        
        <div class="button-container">
            <a href="/dashboard" class="btn btn-primary">
                <i class="fas fa-tachometer-alt"></i> Go to Dashboard
            </a>
            <a href="/" class="btn btn-outline">
                <i class="fas fa-home"></i> Go to Home
            </a>
        </div>
    </div>
</body>
</html>