
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