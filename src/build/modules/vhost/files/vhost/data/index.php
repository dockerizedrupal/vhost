<?php
require_once './vhost.php';

ksort($vhost);
?>
<!DOCTYPE html>

<html>
  <head>
    <meta charset="utf-8">
    <title>vhost</title>
    <style>
      table {
        width: 100%;
      }

      table thead tr th {
        font-size: 30px;
        text-align: left;
        border-bottom: 1px solid #000;
      }

      table tbody tr td {
        padding: 10px 0;
      }

      table tbody tr td.column-1 {
        font-size: 16px;
        width: 10%;
      }

      table tbody tr td.column-2 {
        font-size: 16px;
        width: 90%;
      }
    </style>
  </head>
  <body>
  <?php foreach ($vhost as $host => $repositories): ?>
    <?php ksort($repositories); ?>
    <table>
      <thead>
      <tr>
        <th colspan="2"><?php print $host; ?></th>
      </tr>
      </thead>
      <tbody>
      <?php foreach ($repositories as $repository => $links): ?>
        <?php ksort($links); ?>
        <tr>
          <td class="column-1"><?php print $repository; ?></td>
          <td class="column-2">
            <?php foreach ($links as $link): ?>
              <a href="<?php print $link; ?>" target="_blank"><?php print $link; ?></a> |
            <?php endforeach; ?>
          </td>
        </tr>
      <?php endforeach; ?>
      </tbody>
    </table>
  <?php endforeach; ?>
  </body>
</html>
