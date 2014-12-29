<?php
require_once './vhost.php';

ksort($vhost);
?>
<!DOCTYPE html>

<html>
  <head>
    <meta charset="utf-8">
    <title>vhost</title>
  </head>
  <body>
  <?php foreach ($vhost as $container_name => $links): ?>
    <?php ksort($links); ?>
    <h2><?php print $container_name; ?></h2>
    <?php foreach ($links as $link): ?>
      <p><a href="<?php print $link; ?>"><?php print $link; ?></a></p>
    <?php endforeach; ?>
  <?php endforeach; ?>
  </body>
</html>
