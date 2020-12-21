<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    </head>
    <body>
        <link href="<?php echo base_url() ?>assets/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="<?php echo base_url() ?>assets/css/login.css" rel="stylesheet" id="bootstrap-css">
        <!------ Include the above in your HEAD tag ---------->

        <div class="wrapper <?php echo (validation_errors() !== "" || $this->session->flashdata("error") != "") ? "" : "fadeInDown"; ?>">
            <div id="formContent">
                <!-- Tabs Titles -->
                <!-- Icon -->
                <div class="fadeIn first">
                    <img src="<?php echo base_url() ?>assets/img/logo_grande.png" id="icon" alt="User Icon" />
                </div>

                <!-- Login Form -->
                <form method="POST" action="">
                    <input type="text" id="login" class="fadeIn second" name="email" placeholder="login">
                    <input type="password" id="password" class="fadeIn third" name="password" placeholder="password">

                    <?php if (validation_errors() !== "" || $this->session->flashdata("error") != ""): ?>
                        <div class="alert alert-danger ml-5 mr-5 mt-2" role="alert">
                            <p><?php echo validation_errors(); ?><?php echo $this->session->flashdata("error"); ?></p>
                        </div>
                    <?php endif; ?>
                    <input type="submit" class="fadeIn fourth" value="Log In">
                </form>

                <!-- Remind Passowrd -->
                <div id="formFooter">
                    <a class="underlineHover" href="#">Forgot Password?</a>
                </div>

            </div>
        </div>
        <script src="<?php echo base_url() ?>assets/js/jquery.min.js"></script>
        <script src="<?php echo base_url() ?>assets/js/bootstrap.min.js"></script>
    </body>
</html>