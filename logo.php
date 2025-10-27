  <?php
require_once 'db.php'; // dacă nu e deja inclus sus

$q = trim($_GET['q'] ?? '');

$rezultate = [];
if ($q !== '') {
    // Căutăm codul parțial, fără case sensitivity
    $sql = "SELECT p.*, c.nume AS categorie_nume
            FROM produse p
            JOIN categorii c ON c.id = p.categorie_id
            WHERE p.cod_piesa LIKE ?";
    $rezultate = db_all($sql, ['%' . $q . '%']);
}
?>
  <div class="wrap bar">
    <div class="logo-container">
      <img src="assets/logo/logo.png" alt="logo">
    </div>

<form method="get" action="search.php" class="search-form" role="search" aria-label="Căutare produse">
  <input
    type="text"
    name="q"
    placeholder="Caută cod piesă..."
    value="<?= htmlspecialchars($_GET['q'] ?? '') ?>"
    aria-label="Căutare"
    autocomplete="off"
    enterkeyhint="search"
  >
  <button type="submit" aria-label="Caută">🔍</button>
</form>

      <nav class="navbar">
  <div class="menu-toggle" id="mobile-menu">
    ☰ <!-- simbolul hamburger -->
  </div>

  <ul class="nav-links">
    <li><a href="index.php">Home</a></li>
    <li><a href="contact.php">Contact</a></li>
  </ul>
</nav>

  </div>
  <script>
document.getElementById("mobile-menu").addEventListener("click", function() {
  document.querySelector(".nav-links").classList.toggle("show");
});
</script>
