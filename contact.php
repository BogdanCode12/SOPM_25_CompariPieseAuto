<?php
// avem nevoie de sesiune ca să citim mesajele setate de send_contact.php
if (session_status() === PHP_SESSION_NONE) session_start();
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
  <meta charset="utf-8">
  <title>Compari Piese Auto - Contact</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <header>
  <?php
    include __DIR__ . '/logo.php';
  ?>
</header>
  <main class="wrap">
    <h2>Contactează-ne</h2>

    <section class="contact-info">
      <p><strong>Compari Piese Auto</strong></p>
      <p>Brasov, România</p>
      <p>📧 <a href="mailto:contact@comparipieseauto.ro">contact@comparipieseuauto.ro</a></p>
      <p>📞 <a href="tel:+40712345678">+40 712 345 678</a></p>
    </section>
      <h2>Trimite-ne un mesaj</h2>
    <section class="contact-form">


      <form action="send_contact.php" method="post">
        <label>
          Numele tău:*
          <input type="text" name="name" required
                 value="<?= htmlspecialchars($old['name'] ?? '') ?>">
        </label>

        <label>
          Adresa de email:*
          <input type="email" name="email" required
                 value="<?= htmlspecialchars($old['email'] ?? '') ?>">
        </label>

        <label>
          Subiect:
          <input type="text" name="subject"
                 value="<?= htmlspecialchars($old['subject'] ?? '') ?>">
        </label>

        <label>
          Mesajul tău:*
          <textarea name="message" rows="5" required><?= htmlspecialchars($old['message'] ?? '') ?></textarea>
        </label>

        <button type="submit" class="btn-confirm">Trimite mesajul</button>
      </form>
    </section>

<div id="map" style="width: 100%; height: 400px; border-radius: 10px;"></div>
  </main>
  <?php include __DIR__ . '/footer.php'; ?>
  <script
  async
  defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAhA0MO3dyAw_KpFDfzBR1RmOjtePI8vgI&callback=initMap">
</script>

<script>
  function initMap() {
    const locatie = { lat: 45.64429342424084, lng: 25.595630709839423 }; // exemplu: Brașov
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 18,
      center: locatie,
      mapTypeId: "satellite",
      heading:180
    });
    const marker = new google.maps.Marker({
      position: locatie,
      map: map,
      title: "Compari Piese Auto Brașov",
    });
  }
</script>
 
</body>
</html>