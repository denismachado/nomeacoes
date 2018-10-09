<?php echo $header; ?>
<div class="container">
  <div class="row">
    <div id="content" class="<?php echo $class; ?>">
      <div class="row">
        <div class="col-xs-10 col-xs-offset-1">
          <h1>Total de votos para <b><?=$department['name'];?></b>: <?php echo $total; ?></h1>
        </div>
      </div>

      <? if ($total >= $total_customers){?>
      <div class="row">
        <div class="col-xs-10 col-xs-offset-1">
          <? $x = 0; ?>
          <?php foreach ($results as $result) { ?>
            <? if ($x == 0){ ?>
              <h1 style="color:blue;" ><? echo $result['candidate_name']?> (<? echo $result['votes']?>)</h1>
            <? } else { ?>
              <h4 style="color:red;" ><? echo $result['candidate_name']?> (<? echo $result['votes']?>)</h4>
            <? } ?>
            <? 
              $x = $x+1;
            } 
          ?>
        </div>
      </div>
      <? } else { ?>
      <div class="row">
        <div class="col-xs-10 col-xs-offset-1">
          <h2>Já votaram:</h2>
          <?php foreach ($voters as $vote) { ?>
              <h4><? echo $vote['name']?></h4>
          <? } ?>
        </div>
      </div>
      <? } ?>
      <div class="row">
        <div class="col-xs-10 col-xs-offset-1">
          <div class="buttons clearfix">
            <div class="pull-center">
              <input type="button" onclick="location.href='index.php?route=iasd/vote';" value="Votar" class="btn btn-warning" />
              <input type="button" onclick="location.reload();" value="Atualizar" class="btn btn-success" />
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>
