<?php echo $header; ?>
<div class="container">

  <div class="row">
    <div id="content" class="<?php echo $class; ?>">
      <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
          <div class="well">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label class="control-label" for="input-email">Bem vindo ao software para votação da comissão de nomeações, digite seu username abaixo.</label>
                <input type="text" name="email" value="" placeholder="Username" id="input-email" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                <input type="text" name="password" value="123456" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
              </div>
              <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" />
              <?php if ($redirect) { ?>
              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
              <?php } ?>
            </form>
          </div>
        </div>
      </div>
      </div>
    </div>
</div>
