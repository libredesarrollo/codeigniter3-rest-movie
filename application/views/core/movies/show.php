
<div class="form-group">
    <?php
    echo form_label('Nombre', 'name');
    $input = array(
        'name' => 'name',
        'value' => $name,
        'readonly' => 'readonly',
        'class' => 'form-control',
        'placeholder' => "Nombre"
    );
    echo form_input($input)
    ?>
</div>


<div class="form-group">
    <?php
    echo form_label('Descripción', 'description');
    $input = array(
        'name' => 'description',
        'readonly' => 'readonly',
        'value' => $description,
        'class' => 'form-control',
    );
    echo form_textarea($input)
    ?>
</div>

<div class="form-group">
    <?php
    echo form_label('Año', 'year');
    $input = array(
        'name' => 'year',
        'readonly' => 'readonly',
        'value' => $year,
        'type' => 'number',
        'class' => 'form-control',
        'placeholder' => "Año"
    );
    echo form_input($input)
    ?>
</div>

<?php if ($image != ""): ?>
    <img class="img-small" src="<?php echo base_url() ?>uploads/movies/<?php echo $image ?>">
<?php endif; ?>
