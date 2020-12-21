<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link href="<?php echo base_url() ?>assets/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="<?php echo base_url() ?>assets/core/css/custom.css" rel="stylesheet" id="bootstrap-css">
        <link href="<?php echo base_url() ?>assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="<?php echo base_url() ?>assets/core/css/style.css">
        <link rel="stylesheet" href="<?php echo base_url() ?>assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <link rel="stylesheet" href="<?php echo base_url() ?>assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="<?php echo base_url() ?>assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
        <title>Dashboard - <?php echo NAME_APP ?></title>
        <script src="<?php echo base_url() ?>assets/js/jquery.min.js"></script>
    </head>

    <body>
        <div class="dashboard-main-wrapper">
            <?php $this->load->view('core/templates/header'); ?>

            <?php $this->load->view("core/templates/nav"); ?>

            <div class="dashboard-wrapper">
                <div class="dashboard-ecommerce">
                    <div class="container-fluid dashboard-content ">
                        <?php $this->load->view('core/templates/banner'); ?>
                        <div class="content">
                            {body}
                        </div>
                    </div>
                </div>
                <?php $this->load->view('core/templates/footer'); ?>
            </div>
        </div>

        <script src="<?php echo base_url() ?>assets/js/bootstrap.min.js"></script>
        <script src="<?php echo base_url() ?>assets/js/notify.min.js"></script>
        <script src="<?php echo base_url() ?>assets/core/js/main-js.js"></script>

        <script>
<?php if ($this->session->flashdata("msj") !== null): ?>
                $.notify("<?php echo $this->session->flashdata("msj") ?>", "<?php echo $this->session->flashdata("type") ?>");
<?php endif; ?>
        </script>

</html>