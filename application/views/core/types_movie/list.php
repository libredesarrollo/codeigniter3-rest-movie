<a class="btn btn-danger" href="<?php echo base_url() ?>core/dashboard/type_movie_save">
    <i class="fa fa-plus"></i> Crear
</a>
<br><br>
<table class="table">
    <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Nombre</th>
            <th scope="col">Acciones</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($types_movie as $key => $type_movie) : ?>
            <tr>
                <th scope = "row"><?php echo $type_movie->type_movie_id ?></th>
                <td><?php echo $type_movie->name ?></td>
                <td>
                    <a target="_blank" class="btn btn-primary btn-sm" href="<?php echo base_url() ?>core/dashboard/type_movie_show/<?php echo $type_movie->type_movie_id ?>">
                        <i class="fa fa-eye"></i>
                    </a>
                    <span data-toggle="modal" data-target="#delete-modal" data-id="<?php echo $type_movie->type_movie_id ?>"  data-name="<?php echo $type_movie->name ?>" class="btn btn-danger btn-sm" >
                        <i class="fa fa-trash"></i>
                    </span>
                    <a class="btn btn-primary btn-sm" href="<?php echo base_url() ?>core/dashboard/type_movie_save/<?php echo $type_movie->type_movie_id ?>">
                        <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
            </tr>
        <?php endforeach;
        ?>
    </tbody>
</table>

<div class="modal fade" id="delete-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Borrar: <span></span></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                ¿Seguro que desea borrar el registro seleccionado?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-window-close"></i> Cerrar</button>
                <button type="button" class="btn btn-danger" id="delete-record"><i class="fa fa-trash"></i> Borrar</button>
            </div>
        </div>
    </div>
</div>

<script>
    var button
    var id
    $('#delete-modal').on('show.bs.modal', function (event) {
        button = $(event.relatedTarget)
        var name = button.data('name')
        id = button.data('id')

        var modal = $(this)
        modal.find('.modal-title span').text(name)
    })

    $("#delete-record").click(function () {
        $.ajax({
            url: "<?php echo base_url() ?>core/dashboard/type_movie_delete/"+id,
        }).done(function () {
            $("#delete-modal").modal('hide')
            $(button).parent().parent().remove()
        });
    });
</script>