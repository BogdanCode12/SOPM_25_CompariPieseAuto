<?php
// index.php — Pagina principală (Home)
// Afișează categoriile generale de piese auto

$categorii = [
  ["id"=>"motor",        "nume"=>"Motor",              "icon"=>"assets/icons/motor.svg"],
  ["id"=>"transmisie",   "nume"=>"Transmisie",         "icon"=>"assets/icons/gear.svg"],
  ["id"=>"franare",      "nume"=>"Frânare",            "icon"=>"assets/icons/brake.svg"],
  ["id"=>"directie",     "nume"=>"Direcție & Suspensie","icon"=>"assets/icons/suspension.svg"],
  ["id"=>"electric",     "nume"=>"Electric & Electronic","icon"=>"assets/icons/electric.svg"],
  ["id"=>"filtrare",     "nume"=>"Filtrare & Aer",     "icon"=>"assets/icons/filter.svg"],
  ["id"=>"iluminare",    "nume"=>"Iluminare",          "icon"=>"assets/icons/light.svg"],
  ["id"=>"caroserie",    "nume"=>"Caroserie & Accesorii","icon"=>"assets/icons/body.svg"],
  ["id"=>"racire",       "nume"=>"Răcire & Încălzire", "icon"=>"assets/icons/cooling.svg"],
  ["id"=>"uleiuri",      "nume"=>"Uleiuri & Fluide",   "icon"=>"assets/icons/oil.svg"],
];
?>
<!doctype html>
<html lang="ro">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Compari Piese Auto — Home</title>
  <link rel="stylesheet" href="style.css" />
  <style>
    /* Stiluri minime (fallback) — poți muta în style.css */
    :root{--bg:#fafafa;--card:#fff;--border:#eaeaea;--text:#111;--muted:#666}
    *{box-sizing:border-box}
    body{margin:0;font-family:system-ui,-apple-system,Segoe UI,Roboto,Ubuntu,Helvetica,Arial,sans-serif;background:var(--bg);color:var(--text)}
    .wrap{max-width:1100px;margin:auto;padding:16px}
    header{position:sticky;top:0;background:var(--bg);border-bottom:1px solid var(--border);z-index:10}
    header .bar{display:flex;align-items:center;justify-content:space-between;gap:12px}
    h1{font-size:1.25rem;margin:8px 0}
    nav a{color:inherit;text-decoration:none;opacity:.8}
    nav a:hover{opacity:1}
    .hero{padding:18px 0 8px}
    .hero p{margin:6px 0;color:var(--muted)}
    .grid{display:grid;grid-template-columns:repeat(1,minmax(0,1fr));gap:12px;margin:12px 0 24px}
    @media(min-width:640px){.grid{grid-template-columns:repeat(2,1fr)}}
    @media(min-width:960px){.grid{grid-template-columns:repeat(4,1fr)}}
    .card{display:block;border:1px solid var(--border);border-radius:14px;background:var(--card);padding:14px;text-decoration:none;color:inherit;box-shadow:0 1px 4px rgba(0,0,0,.04);transition:transform .06s ease, box-shadow .06s ease}
    .card:hover{transform:translateY(-2px);box-shadow:0 6px 16px rgba(0,0,0,.08)}
    .card img{width:56px;height:56px;object-fit:contain;background:#f5f5f5;border-radius:10px}
    .card h3{margin:10px 0 4px;font-size:1rem}
    .card p{margin:0;color:var(--muted);font-size:.9rem}
    footer{border-top:1px solid var(--border);opacity:.75;margin-top:16px}
  </style>
</head>
<body>
<header>
  <div class="wrap bar">
    <h1>Compari Piese Auto</h1>
    <nav>
      <a href="index.php">Home</a>
      <!-- Poți adăuga linkuri către pagina 2/3 când sunt gata -->
    </nav>
  </div>
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

<footer class="wrap">
  <p>© SOPM • Compari Piese Auto</p>
</footer>
</body>
</html>
