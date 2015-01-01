<?php
require_once './vhost.php';

ksort($vhost);
?>
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>vhost</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="container">
      <?php foreach ($vhost as $host => $containers): ?>
        <?php ksort($containers); ?>
        <div class="row">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title"><?php print $host; ?></h3>
            </div>
            <table class="table">
              <tbody>
                <?php foreach ($containers as $container => $links): ?>
                <?php ksort($links); ?>
                <tr>
                  <td class="column-1"><?php print $container; ?></td>
                  <td class="column-2">
                    <?php foreach ($links as $link): ?>
                    <a href="<?php print $link; ?>" target="_blank"><?php print $link; ?></a> |
                    <?php endforeach; ?>
                  </td>
                </tr>
                <?php endforeach; ?>
              </tbody>
            </table>
          </div>
        </div>
      <?php endforeach; ?>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
