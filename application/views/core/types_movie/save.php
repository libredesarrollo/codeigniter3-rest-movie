<?php echo form_open_multipart(); ?>

<?php if (validation_errors() !== ""): ?>
    <div class="alert alert-danger" role="alert">
        <?php echo validation_errors(); ?>
    </div>
<?php endif; ?>


<div class="form-group">
    <?php
    echo form_label('Nombre', 'name');
    $input = array(
        'name' => 'name',
        'value' => $name,
        'class' => 'form-control',
        'placeholder' => "Nombre"
    );
    echo form_input($input)
    ?>
</div>

<?php echo form_submit('submit', 'Guardar', 'class="btn btn-primary"'); ?>

<?php echo form_close(); ?>