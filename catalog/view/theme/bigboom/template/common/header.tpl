<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>
		<?php echo $title; ?>
	</title>
	<base href="<?php echo $base; ?>" />
	<?php if ($description) { ?>
		<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	<?php if ($keywords) { ?>
		<meta name="keywords" content="<?php echo $keywords; ?>" />
	<?php } ?>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<?php if ($icon) { ?>
		<link href="<?php echo $icon; ?>" rel="icon" />
	<?php } ?>
	<?php foreach ($links as $link) { ?>
		<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>
	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/owl.carousel.2.0.0-beta.2.4/assets/owl.carousel.css">
	<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="catalog/view/theme/bigboom/stylesheet/bootstrap.css" rel="stylesheet">
	<link href="catalog/view/theme/bigboom/stylesheet/ypnstyle.css" rel="stylesheet">
	<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
	<!-- <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" /> -->
	<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<?php foreach ($styles as $style) { ?>
	    	<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
	<?php } ?>
	<script src="catalog/view/javascript/jquery.jCounter-0.1.4.js" type="text/javascript"></script>	
	<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
	<script src="catalog/view/javascript/modern.js" type="text/javascript"></script>
	<script src="catalog/view/javascript/module/ddSlick.js" type="text/javascript"></script>
	<?php foreach ($scripts as $script) { ?>
		<script src="<?php echo $script; ?>" type="text/javascript"></script>
	<?php } ?>
	<script type="text/javascript" src="catalog/view/javascript/owl.carousel.2.0.0-beta.2.4/owl.carousel.min.js"></script>
</head>
<body class="<?php echo $class; ?>">	
	<div id="top">
		<span class="close fa fa-times"></span>
		<h2>Special Offer!</h2>
		<h4>Rewarding all customers with a 15% discount.</h4>
		<h5>this offer is available from 9th December to 19th December 2015</h5>
	</div>
	<header class="header header-1">
		<nav id="top-nav">
			<div class="container">
				<div class="row">
					<ul class="top-left col-sm-4 clearfix">
						<li class="dropdown language">
							<?php echo $language; ?>
						</li>
						<li class="dropdown currency">
							<?php echo $currency; ?>
						</li>
					</ul>
					<div class="top-right col-sm-8">
						<ul class="toplink-wrapper pull-right clearfix">
							<li>
								<a href="<?php echo $account; ?>" class="top-link account-link">
									<?php echo $text_account; ?>
								</a>
							</li>
							<li>
								<a href="<?php echo $checkout; ?>" class="top-link checkout-link" title="<?php echo $text_checkout; ?>"><span><?php echo $text_checkout; ?></span></a>
							</li>
							<li>
								<a href="<?php echo $shopping_cart; ?>" class="top-link shopping-cart-link" title="<?php echo $text_shopping_cart; ?>"><span><?php echo $text_shopping_cart; ?></span></a>
							</li>
							<li>
								<a href="<?php echo $wishlist; ?>" id="wishlist-total" class="top-link wishlish-link" title="<?php echo $text_wishlist; ?>"><span><?php echo $text_wishlist; ?></span></a>
							</li>
							<li>
								<a href="<?php echo $login; ?>" class="top-link login-link">
									<span><?php echo $text_login; ?></span>
								</a>
								<span> / </span>
								<a href="<?php echo $logout; ?>" class="top-link logout-link">
									<?php echo $text_logout; ?>
								</a>
							</li>
							
						</ul>
					</div>
				</div>
			</div>
		</nav>
		<div class="main-header">
			<div class="container">
				<div class="logo-search-cart">
					<div class="row">
						<div class="logo col-md-3 col-sm-12">
							<?php if ($logo) { ?>
							<a href="<?php echo $home1; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>"></a>
							<?php } else { ?>
							<h1><a href="<?php echo $home1; ?>"><?php echo $name; ?></a></h1>
							<?php } ?>
						</div>
						<div class="top-search col-md-6 col-sm-8">
							<?php echo $search; ?>
						</div>
						<div class="shopping-cart col-md-3 col-sm-4">
							<?php echo $cart; ?>
						</div>
					</div>
				</div>
				<div id="top-menu" class="hidden-xs">
					<?php echo $top_menu; ?>	 	
				</div> 
				<div class="visible-xs">
					<?php echo $menu; ?>
				</div>
			</div>
		</div>	
	</header>

