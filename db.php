<?php
// db.php — conexiune PDO la MySQL (simplu și sigur)
// Folosește UTF-8, erori ca excepții și (opțional) conexiune persistentă.
//
// ✅ Cum folosești:
// require_once __DIR__ . '/db.php';
// $pdo = db();
// $stmt = $pdo->prepare('SELECT * FROM produse WHERE categorie = ?');
// $stmt->execute(['franare']);
// $rows = $stmt->fetchAll();

function db(): PDO {
  static $pdo = null;
  if ($pdo instanceof PDO) {
    return $pdo;
  }

  // —— Config ——————————————————————————————————————————————
  $db_host = getenv('DB_HOST') ?: 'localhost';
  $db_name = getenv('DB_NAME') ?: 'softhave_comparipieseauto';
  $db_user = getenv('DB_USER') ?: 'softhave_comparipieseauto';
  $db_pass = getenv('DB_PASS') ?: 'pulasanatoasa';

  $dsn = "mysql:host={$db_host};port={$db_port};dbname={$db_name};charset=utf8mb4";

  $options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, // aruncă excepții
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,       // array asociativ
    PDO::ATTR_EMULATE_PREPARES   => false,                  // pregătite native
    PDO::ATTR_PERSISTENT         => false,                  // setează true dacă vrei persistent
  ];

  try {
    $pdo = new PDO($dsn, $db_user, $db_pass, $options);
  } catch (Throwable $e) {
    // Mesaj prietenos (nu expune credențiale)
    http_response_code(500);
    exit('Eroare conexiune la baza de date. Verifică setările din db.php/.env');
  }

  return $pdo;
}

// —— Helper-uri opționale ——————————————————————————————
/** Execută în siguranță o interogare cu parametri și returnează toate rândurile */
function db_all(string $sql, array $params = []): array {
  $stmt = db()->prepare($sql);
  $stmt->execute($params);
  return $stmt->fetchAll();
}

/** Execută o interogare (INSERT/UPDATE/DELETE) și returnează numărul de rânduri afectate */
function db_exec(string $sql, array $params = []): int {
  $stmt = db()->prepare($sql);
  $stmt->execute($params);
  return $stmt->rowCount();
}

/** Returnează primul rând sau null */
function db_one(string $sql, array $params = []): ?array {
  $stmt = db()->prepare($sql);
  $stmt->execute($params);
  $row = $stmt->fetch();
  return $row === false ? null : $row;
}
