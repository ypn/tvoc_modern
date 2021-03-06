<?php if (count($currencies) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency">
  <div class="btn-group">
    <button class="btn btn-link dropdown-toggle dropdown-hover" data-toggle="dropdown">
		<?php foreach ($currencies as $currency) { ?>
		<?php if ($currency['symbol_left'] && $currency['code'] == $code) { ?>
			<a href="#" class="top-link currency-link">
        <?php echo $currency['title']; ?><i class="fa fa-caret-down"></i>
      </a>
		<?php } elseif ($currency['symbol_right'] && $currency['code'] == $code) { ?>
			<a href="#" class="top-link currency-link">
        <?php echo $currency['title']; ?> <i class="fa fa-caret-down"></i>
      </a>
		<?php } ?>
		<?php } ?>
	   
	   </button>
    <ul class="dropdown-menu">
      <?php foreach ($currencies as $currency) { ?>
      <?php if ($currency['symbol_left']) { ?>
      <li><button class="currency-select btn btn-link btn-block dropdown-menu-item" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></button></li>
      <?php } else { ?>
      <li><button class="currency-select btn btn-link btn-block dropdown-menu-item" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></button></li>
      <?php } ?>
      <?php } ?>
    </ul>
  </div>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
<?php } ?>
