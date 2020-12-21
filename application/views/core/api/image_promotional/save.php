<?php echo form_open_multipart(); ?>

<div class="form-group">
    <?php
    echo form_label('Imagen', 'image');
    $input = array(
        'name' => 'image',
        'type' => 'file',
        'class' => 'form-control',
    );
    echo form_input($input)
    ?>
</div>

<?php if ($image != ""): ?>
    <img class="img-small" src="<?php echo base_url() ?>uploads/api/<?php echo $image ?>">
<?php endif; ?>

<?php echo form_submit('submit', 'Guardar', 'class="btn btn-primary"'); ?>

<?php echo form_close(); ?>