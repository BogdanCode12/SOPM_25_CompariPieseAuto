<?php
require_once 'db.php';

$q = trim($_GET['q'] ?? '');

$rezultate = [];
if ($q !== '') {
  $sql = "SELECT p.*, c.nume AS categorie_nume 
          FROM produse p
          JOIN categorii c ON c.id = p.categorie_id
          WHERE p.cod_piesa LIKE ?";
  $rezultate = db_all($sql, ['%' . $q . '%']);
}
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
  <title>Rezultate pentru „<?= htmlspecialchars($q) ?>” - Compari Piese Auto</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="style.css">
</head>
<body>
<header>
  <?php include __DIR__ . '/logo.php'; ?> 
</header>
  <div class="container">
    <h1>Rezultate pentru „<?= htmlspecialchars($q) ?>”</h1>
    <?php if ($q === ''): ?>
      <p>Introdu un cod de piesă pentru a începe căutarea.</p>
    <?php elseif (empty($rezultate)): ?>
      <p>Nu s-a găsit nicio piesă cu acest cod.</p>
    <?php else: ?>
      <div class="rezultate">
        <?php foreach ($rezultate as $p): ?>
          <div class="produs">
            <img src="<?= htmlspecialchars($p['imagine']) ?>" alt="<?= htmlspecialchars($p['nume']) ?>"
                 onerror="this.src='assets/icons/placeholder.svg'">
            <h3><?= htmlspecialchars($p['nume']) ?></h3>
            <div class="pret"><?= number_format($p['pret'], 2) ?> lei</div>
            <div class="sursa">Sursă: <?= htmlspecialchars($p['sursa']) ?></div>
            <div class="link">
              <a href="<?= htmlspecialchars($p['link']) ?>" target="_blank">
                Vezi pe <?= htmlspecialchars($p['sursa']) ?>
              </a>
            </div>
            <p style="font-size: 0.9rem; color: #999;">
              Categorie: <?= htmlspecialchars($p['categorie_nume']) ?>
            </p>
          </div>
        <?php endforeach; ?>
      </div>
    <?php endif; ?>
  </div>
    <?php include __DIR__ . '/footer.php'; ?> 
</body>
</html>
