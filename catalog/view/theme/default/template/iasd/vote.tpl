<?php echo $header; ?>
<div class="container">
  <div class="row">
    <div id="content" class="<?php echo $class; ?>">
  <?php if ($success != '') { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
      <div class="row">
        <div class="col-xs-10 col-xs-offset-1">
          <h1><?php echo $candidates[0]['name']; ?></h1>
        </div>
      </div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal" id="vote">
        <fieldset>
          <input type="hidden" name="department_id" value="<? echo $candidates[0]['department_id'];?>">
          <div class="row">
            <div class="col-xs-10 col-xs-offset-1">
            <label>* Nomeados: </label>
              <select name="candidate_id" class="form-control required">
              <option value=""> Escolha</option>
              <?php foreach ($candidates as $candidate) { ?>
                <option value="<? echo $candidate['candidate_id']?>"><? echo $candidate['candidate_name']?></option>
              <?php } ?>
              </select>
              <div class="buttons clearfix">
                <div class="pull-center">
                  <input type="submit" value="Votar!" class="btn btn-primary" />
                  <input type="button" onclick="location.reload();" value="Atualizar" class="btn btn-success" />
                  <input type="button" onclick="location.href='index.php?route=iasd/result';" value="Ver Resultado" class="btn btn-warning" />
                </div>
              </div>
            </div>
          </div>
        </fieldset>
      </form>
    </div>
  </div>
</div>
<script>
$("#vote").validate();
</script>