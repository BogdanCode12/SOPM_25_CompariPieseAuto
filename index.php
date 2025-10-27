<?php
// index.php — Pagina principală (Home)
// Afișează categoriile generale de piese auto

$categorii = [
  ["id"=>"motor",        "nume"=>"Motor",              "icon"=>"assets/icons/motor.svg"],
  ["id"=>"transmisie",   "nume"=>"Transmisie",         "icon"=>"assets/icons/gear.svg"],
  ["id"=>"franare",      "nume"=>"Franare",            "icon"=>"assets/icons/brake.svg"],
  ["id"=>"directie",     "nume"=>"Directie & Suspensie","icon"=>"assets/icons/suspension.svg"],
  ["id"=>"electric",     "nume"=>"Electric & Electronic","icon"=>"assets/icons/electric.svg"],
  ["id"=>"filtrare",     "nume"=>"Filtrare & Aer",     "icon"=>"assets/icons/filter.svg"],
  ["id"=>"iluminare",    "nume"=>"Iluminare",          "icon"=>"assets/icons/light.svg"],
  ["id"=>"caroserie",    "nume"=>"Caroserie & Accesorii","icon"=>"assets/icons/body.svg"],
  ["id"=>"racire",       "nume"=>"Racire & Incalzire", "icon"=>"assets/icons/cooling.svg"],
  ["id"=>"uleiuri",      "nume"=>"Uleiuri & Fluide",   "icon"=>"assets/icons/oil.svg"],
];
?>
<!doctype html>
<html lang="ro">
<head>
  <link rel="icon" type="image/x-icon" href="assets/logo/favicon.ico">
  <link rel="icon" type="image/png" sizes="32x32" href="logo/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="logo/favicon-16x16.png">
  <link rel="apple-touch-icon" sizes="180x180" href="logo/apple-touch-icon.png">
  <link rel="android-chrome-192x192" sizes="192x192" href="android-chrome-192x192.png">
  <link rel="android-chrome-512x512" sizes="512x512" href="android-chrome-512x512.png">
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Compari Piese Auto — Home</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
<header>
  <?php include __DIR__ . '/logo.php'; ?> 
</header>

<main class="wrap">
  <section class="hero">
    <h2 style="margin:0">Categorii generale</h2>
    <p>Alege o categorie pentru a vedea piesele disponibile.</p>
  </section>

  <section class="grid" aria-label="Categorii de piese auto">
    <?php foreach ($categorii as $cat): ?>
      <a class="card" href="categorie.php?c=<?= urlencode($cat['id']) ?>" aria-label="<?= htmlspecialchars($cat['nume']) ?>">
        <img src="<?= htmlspecialchars($cat['icon']) ?>" alt="Icon <?= htmlspecialchars($cat['nume']) ?>" onerror="this.src='assets/icons/placeholder.svg'">
        <h3><?= htmlspecialchars($cat['nume']) ?></h3>
        <p>Intră în categoria "<?= htmlspecialchars($cat['nume']) ?>"</p>
      </a>
    <?php endforeach; ?>
  </section>
</main>

  <?php include __DIR__ . '/footer.php'; ?> 
</body>
</html>
