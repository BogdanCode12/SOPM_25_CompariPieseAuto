<?php
require_once 'db.php';

$categorie_id = $_GET['c'] ?? '';
if (!$categorie_id) die('Categorie invalidă.');

$categorie = db_one("SELECT * FROM categorii WHERE id = ?", [$categorie_id]);
if (!$categorie) die('Categorie inexistentă.');

$produse = db_all("SELECT * FROM produse WHERE categorie_id = ?", [$categorie_id]);
?>
<!DOCTYPE html>
<html lang="ro">
<head>
  <link rel="icon" type="image/x-icon" href="assets/logo/favicon.ico">
  <link rel="icon" type="image/png" sizes="32x32" href="logo/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="logo/favicon-16x16.png">
  <link rel="apple-touch-icon" sizes="180x180" href="logo/apple-touch-icon.png">
  <link rel="android-chrome-192x192" sizes="192x192" href="android-chrome-192x192.png">
  <link rel="android-chrome-512x512" sizes="512x512" href="android-chrome-512x512.png">
  <meta charset="UTF-8">
  <title><?= htmlspecialchars($categorie['nume']) ?> - Compari Piese Auto</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="style.css">
</head>
<body>
<header>
  <?php include __DIR__ . '/logo.php'; ?>
</header>
  <div class="container">
    <h1><?= htmlspecialchars($categorie['nume']) ?></h1>
    <div class="produse">
      <?php foreach ($produse as $p): ?>
        <div class="produs">
          <img src="<?= htmlspecialchars($p['imagine']) ?>" alt="<?= htmlspecialchars($p['nume']) ?>"
               onerror="this.src='assets/icons/placeholder.svg'">
          <h3><?= htmlspecialchars($p['nume']) ?></h3>
          <div class="cod_piesa">Cod Piesa:<?= htmlspecialchars($p['cod_piesa']) ?></div>
          <div class="pret"><?= number_format($p['pret'], 2) ?> lei</div>
          <div class="sursa">Sursă: <?= htmlspecialchars($p['sursa']) ?></div>
          <div class="link"><a href="<?= htmlspecialchars($p['link']) ?>" target="_blank">Vezi pe <?= htmlspecialchars($p['sursa']) ?></a></div>
        </div>
      <?php endforeach; ?>
    </div>
  </div>
    <?php include __DIR__ . '/footer.php'; ?> 
</body>
</html>
