-- -------------------------------------------------------------
-- BAZA DE DATE: softhave_comparipieseauto
-- -------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS softhave_comparipieseauto CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE softhave_comparipieseauto;

-- -------------------------------------------------------------
-- Tabel: categorii
-- -------------------------------------------------------------

CREATE TABLE categorii (
    id VARCHAR(50) PRIMARY KEY,
    nume VARCHAR(100) NOT NULL,
    icon VARCHAR(255) DEFAULT NULL
);

INSERT INTO categorii (id, nume, icon) VALUES
('motor', 'Motor', 'assets/icons/motor.svg'),
('transmisie', 'Transmisie', 'assets/icons/gear.svg'),
('franare', 'Frânare', 'assets/icons/brake.svg'),
('directie', 'Direcție & Suspensie', 'assets/icons/suspension.svg'),
('electric', 'Electric & Electronic', 'assets/icons/electric.svg'),
('filtrare', 'Filtrare & Aer', 'assets/icons/filter.svg'),
('iluminare', 'Iluminare', 'assets/icons/light.svg'),
('caroserie', 'Caroserie & Accesorii', 'assets/icons/body.svg'),
('racire', 'Răcire & Încălzire', 'assets/icons/cooling.svg'),
('uleiuri', 'Uleiuri & Fluide', 'assets/icons/oil.svg');

-- -------------------------------------------------------------
-- Tabel: produse
-- -------------------------------------------------------------

CREATE TABLE produse (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nume VARCHAR(255) NOT NULL,
    cod_piesa VARCHAR(100) DEFAULT NULL,
    pret DECIMAL(10,2) NOT NULL,
    imagine VARCHAR(500) DEFAULT NULL,
    link VARCHAR(500) DEFAULT NULL,
    sursa ENUM('autodoc24', 'epiesa', 'altele') NOT NULL,
    categorie_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (categorie_id) REFERENCES categorii(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- -------------------------------------------------------------
-- PRODUSE DEMONSTRATIVE
-- -------------------------------------------------------------

INSERT INTO produse (nume, cod_piesa, pret, imagine, link, sursa, categorie_id) VALUES
('Lichid de frana ATE SL DOT4 03.9901-5832.2', '03.9901-5832.2', 44.00, 'https://www.mesterino.ro/poze_produse/106026_1.jpg', 'https://www.epiesa.ro/lichid-de-frana-ate-sl-dot4-03-9901-5832-2-volum-1-litru-mstrnid-106026.htm', 'epiesa', 'uleiuri'),
('ATE DOT 4 03.9901-5832.2', '03.9901-5832.2', 53.99, 'https://cdn.autodoc.de/thumb?id=16165017&m=0&n=0&lng=ro&rev=94077948', 'https://www.autodoc24.ro/ate/16165017?search=ATE+Lichid+de+frana+%2803.9901-5832.2%29', 'autodoc24', 'uleiuri'),
('Ulei motor MOTUL 4100 SYN-nergy SPEC 10W40, volum 5 litri, sintetic', '3374650406909', 147.00, 'https://www.mesterino.ro/poze_produse/149788_1.png', 'https://www.epiesa.ro/ulei-motor-motul-4100-syn-nergy-spec-10w40-volum-5-litri-sintetic-mstrnid-149788.htm', 'epiesa', 'uleiuri'),
('MOTUL 4100 Syn-nergy Spec 112892 Ulei de motor', '3374650406909', 173.99, 'https://cdn.autodoc.de/thumb?id=23151452&m=0&n=0&lng=ro&rev=94077948', 'https://www.autodoc24.ro/motul/23151452', 'autodoc24', 'uleiuri'),
('Ulei motor KROON OIL Torsynth 10W40 02336, volum 5 litri, semi sintetic', '8710128023363', 149.00, 'https://www.mesterino.ro/poze_produse/141651_1.png', 'https://www.epiesa.ro/ulei-motor-kroon-oil-torsynth-10w40-02336-volum-5-litri-semi-sintetic-mstrnid-141651.htm', 'epiesa', 'uleiuri'),
('KROON OIL Torsynth 02336 Ulei de motor', '8710128023363', 154.49, 'https://cdn.autodoc.de/thumb?id=13738608&m=0&n=0&lng=ro&rev=94077948', 'https://www.autodoc24.ro/kroon-oil/13738608', 'autodoc24', 'uleiuri'),
('Ulei hidraulic LIQUI MOLY 20468, volum 1 litru, sintetic, verde, pentru sistemul hidraulic central', '4100420011276', 126.00, 'https://www.mesterino.ro/poze_produse/83835_1.jpg', 'https://www.epiesa.ro/ulei-hidraulic-liqui-moly-20468-volum-1-litru-sintetic-verde-pentru-sistemul-hidraulic-central-mstrnid-83835.htm', 'epiesa', 'uleiuri'),
('LIQUI MOLY Zentralhydrauliköl 1127 Ulei hidraulica centrala', '4100420011276', 89.49, 'https://cdn.autodoc.de/thumb?id=2451781&m=0&n=0&lng=ro&rev=94077948', 'https://www.autodoc24.ro/liqui-moly/2451781', 'autodoc24', 'uleiuri'),
('Ulei transmisie automata MANNOL Automatic ATF Dexron II MN8205-1, volum 1 litru, mineral', 'MN8205-1', 36.00, 'https://www.mesterino.ro/poze_produse/108972_1.png', 'https://www.epiesa.ro/ulei-transmisie-automata-mannol-automatic-atf-dexron-ii-mn8205-1-volum-1-litru-mineral-mstrnid-108972.htm', 'epiesa', 'uleiuri'),
('MANNOL DEXRON II Automatic MN8205-1 Ulei cutie automata', 'MN8205-1', 29.99, 'https://cdn.autodoc.de/thumb?id=13546525&m=0&n=0&lng=ro&rev=94077948', 'https://www.autodoc24.ro/mannol/13546525', 'autodoc24', 'uleiuri'),
('Filtru ulei BMW Seria 5 (F10) 520 d diesel 184 cai MANN-FILTER HU 6004 x', 'HU 6004 x', 65.00, 'https://www.epiesa.ro/produse_2024_4/4/hu_6004_x.jpg', 'https://www.epiesa.ro/filtru-ulei-bmw-seria-5-f10-520-d-diesel-184-cai-mann-filter-hu6004x/33010/100259/epsroprdt-2508904/', 'epiesa', 'filtrare'),
('MANN-FILTER HU 6004 x Filtru ulei', 'HU 6004 x', 76.49, 'https://media.autodoc.de/360_photos/7183239/h-preview.jpg', 'https://www.autodoc24.ro/mann-filter/7183239#filtru-ulei', 'autodoc24', 'filtrare'),
('Filtru aer BMW Seria 5 (F10) 520 d diesel 184 cai MAHLE ORIGINAL LX 3598', 'LX 3598', 200.00, 'https://www.epiesa.ro/produse_2024_4/287/78424165.jpg', 'https://www.epiesa.ro/filtru-aer-bmw-seria-5-f10-520-d-diesel-184-cai-mahle-original-lx3598/33010/100260/epsroprdt-321358/', 'epiesa', 'filtrare'),
('MAHLE LX 3598 Filtru aer pentru BMW Seria 7, Seria 5', 'LX 3598', 191.49, 'https://media.autodoc.de/360_photos/7884580/h-preview.jpg', 'https://www.autodoc24.ro/mahle-original/7884580', 'autodoc24', 'filtrare'),
('Filtru polen MANN-FILTER FP2533-2', 'FP 2533-2', 444.00, 'https://www.epiesa.ro/produse_2024_4/4/fp_2533-2.jpg', 'https://www.epiesa.ro/filtru-polen-mann-filter-fp2533-2-epsroprdt-2508251.htm', 'epiesa', 'filtrare'),
('MANN-FILTER FP 2533-2 Filtru, aer habitaclu', 'FP 2533-2', 379.00, 'https://media.autodoc.de/360_photos/7889402/h-preview.jpg', 'https://www.autodoc24.ro/mann-filter/7889402', 'autodoc24', 'filtrare'),
('Filtru combustibil BMW Seria 5 (F10) 520 d diesel 184 cai MANN-FILTER WK 5002', 'WK 5002', 195.00, 'https://www.epiesa.ro/produse_2024_4/4/wk_5002.jpg', 'https://www.epiesa.ro/filtru-combustibil-bmw-seria-5-f10-520-d-diesel-184-cai-mann-filter-wk5002/33010/100261/epsroprdt-2510621/', 'epiesa', 'filtrare'),
('MANN-FILTER WK 5002 Filtru combustibil', 'WK 5002', 172.49, 'https://media.autodoc.de/360_photos/20831196/h-preview.jpg', 'https://www.autodoc24.ro/mann-filter/20831196#filtru-combustibil', 'autodoc24', 'filtrare'),
('Set filtru hidraulic cutie de viteza automata VAICO V20-0587', 'V20-0587', 224.00, 'https://www.epiesa.ro/produse_2024_4/162/v20-0587_02.jpg', 'https://www.epiesa.ro/set-filtru-hidraulic-cutie-de-viteza-automata-vaico-v20-0587-epsroprdt-369718.htm', 'epiesa', 'filtrare'),
('VAICO V20-0587 Set de filtru hidraulic cutie de viteze automată', 'V20-0587', 278.50, 'https://media.autodoc.de/360_photos/7656695/h-preview.jpg', 'https://www.autodoc24.ro/vaico/7656695', 'autodoc24', 'filtrare'),
('Baterie auto BANNER Starting Bull 562 19, tensiune 12 V, amperaj 62 Ah, curent pornire 510 A', '9005753006706', 463.00, 'https://www.mesterino.ro/poze_produse/66316_1.jpg', 'https://www.epiesa.ro/baterie-auto-banner-starting-bull-562-19-tensiune-12-v-amperaj-62-ah-curent-pornire-510-a-mstrnid-66316.htm', 'epiesa', 'electric'),
('BANNER 562 19 Baterie de pornire', '9005753006706', 470.50, 'https://cdn.autodoc.de/thumb?id=21255355&m=0&n=0&lng=ro&rev=94077948', 'https://www.autodoc24.ro/bannerpool/21255355', 'autodoc24', 'electric'),
('Antena auto universala ALCA 534000, pentru interior, negru, cu amplificator, lungime 2 metri, material ABS, PVC, fibra de sticla, metal', '4028224534008', 61.00, 'https://www.mesterino.ro/poze_produse/45040_1.jpg', 'https://www.epiesa.ro/antena-auto-universala-alca-534000-pentru-interior-negru-cu-amplificator-lungime-2-metri-material-abs-pvc-fibra-de-sticla-metal-mstrnid-45040.htm', 'epiesa', 'electric'),
('ALCA Aktiv 534000 Antenă', '4028224534008', 52.99, 'https://cdn.autodoc.de/thumb?id=14541120&m=0&n=0&lng=ro&rev=94077948', 'https://www.autodoc24.ro/alca/14541120', 'autodoc24', 'electric'),
('Claxon tip trompeta BORG HICO FNF008, pentru camioane', 'FNF008', 398.00, 'https://www.mesterino.ro/poze_produse/96001_1.jpg', 'https://www.epiesa.ro/claxon-tip-trompeta-borg-hico-fnf008-pentru-camioane-mstrnid-96001.htm', 'epiesa', 'electric'),
('HICO FNF008 Claxon', 'FNF008', 156.99, 'https://cdn.autodoc.de/thumb?id=14736442&m=0&n=0&lng=ro&rev=94077948', 'https://camioane.autodoc24.ro/hico/14736442', 'autodoc24', 'electric'),
('Cablu electric spiralat bricheta auto ALCA Electro Cable 570000, 12, 24 V, 6 A, lungime cablu 5 metri', '4028224570006', 76.00, 'https://www.mesterino.ro/poze_produse/131259_1.png', 'https://www.epiesa.ro/cablu-electric-spiralat-bricheta-auto-alca-electro-cable-570000-12-24-v-6-a-lungime-cablu-5-metri-mstrnid-131259.htm', 'epiesa', 'electric'),
('ALCA Electro Cable 570000 Cablu electric, bricheta', '4028224570006', 67.99, 'https://cdn.autodoc.de/thumb?id=21107263&m=0&n=0&lng=ro&rev=94077948', 'https://www.autodoc24.ro/alca/21107263', 'autodoc24', 'electric'),
('Invertor auto OSRAM Pure Sine Wave OEINVPAR20, 12V DC, 2000W, RCD, 1 x priza 230V + 1 x USB 2.1A', '4052899631069', 5759.00, 'https://www.mesterino.ro/poze_produse/112808_1.jpg', 'https://www.epiesa.ro/invertor-auto-osram-pure-sine-wave-oeinvpar20-12v-dc-2000w-rcd-1-x-priza-230v-1-x-usb-2-1a-mstrnid-112808.htm', 'epiesa', 'electric'),
('OSRAM POWERinvert PRO OEINVPAR20 Invertor', '4052899631069', 4220.00, 'https://cdn.autodoc.de/thumb?id=20293687&m=0&n=0&lng=ro&rev=94077948', 'https://www.autodoc24.ro/osram/20293687', 'autodoc24', 'electric'),
('Butuc roata FEBI BILSTEIN 36679', '36679', 386.00, 'https://www.epiesa.ro/produse_2024_4/101/36679_1.jpg', 'https://www.epiesa.ro/butuc-roata-febi-bilstein-36679-epsroprdt-1778026.htm', 'epiesa', 'directie'),
('FEBI BILSTEIN 36679 Butuc roata pentru BMW Seria 7, Seria 5, Seria 6', '36679', 353.00, 'https://cdn.autodoc.de/thumb?id=7003726&m=0&n=0&lng=ro&rev=94077948', 'https://www.autodoc24.ro/febi-bilstein/7003726#butuc-roata', 'autodoc24', 'directie'),
('Brat suspensie roata FEBI BILSTEIN 39086', '39086', 145.00, 'https://www.epiesa.ro/produse_2024_4/101/39086_1.jpg', 'https://www.epiesa.ro/brat-suspensie-roata-febi-bilstein-39086-epsroprdt-1780235.htm', 'epiesa', 'directie'),
('FEBI BILSTEIN 39086 Brat, suspensie roata pentru BMW Seria 7, Seria 5, Seria 6', '39086', 114.99, 'https://media.autodoc.de/360_photos/7106933/h-preview.jpg', 'https://www.autodoc24.ro/febi-bilstein/7106933', 'autodoc24', 'directie'),
('Cap de bara MEYLE 3160200024', '316 020 0024', 164.00, 'https://www.epiesa.ro/produse_2024_4/144/fs_3160200024_1.jpg', 'https://www.epiesa.ro/cap-de-bara-meyle-3160200024-epsroprdt-514632.htm', 'epiesa', 'directie'),
('MEYLE -ORIGINAL Quality 316 020 0024 Cap de bara pentru BMW Seria 7, Seria 5', '316 020 0024', 153.99, 'https://cdn.autodoc.de/thumb?id=7280440&m=0&n=0&lng=ro&rev=94077948', 'https://www.autodoc24.ro/meyle/7280440#cap-de-bara', 'autodoc24', 'directie'),
('Caseta directie LIZARTE 06.09.1600', '06.09.1600', 5109.00, 'https://www.epiesa.ro/produse_2024_4/292/jpg06091600.jpg', 'https://www.epiesa.ro/caseta-directie-lizarte-06-09-1600-epsroprdt-406347.htm', 'epiesa', 'directie'),
('LIZARTE 06.09.1600 Casetă de direcție pentru BMW Seria 5', '06.09.1600', 2268.00, 'https://cdn.autodoc.de/thumb?dynamic=generic_icons&name=286&mode=5', 'https://www.autodoc24.ro/lizarte/8132522#caseta-de-directie', 'autodoc24', 'directie'),
('Ulei pentru cutii de viteze automate MOBIL ATF Multi-Vehicle DEXRON VI (II-III), volum 1 litru, sintetic', '156090', 69.00, 'https://www.mesterino.ro/poze_produse/80273_2.jpg', 'https://www.epiesa.ro/ulei-pentru-cutii-de-viteze-automate-mobil-atf-multi-vehicle-dexron-vi-ii-iii-volum-1-litru-sintetic-mstrnid-80273.htm', 'epiesa', 'directie'),
('MOBIL ATF Multi-Vehicle 156090 Ulei servodirectie', '156090', 69.99, 'https://cdn.autodoc.de/thumb?id=17470342&m=0&n=0&lng=ro&rev=94077948', 'https://www.autodoc24.ro/mobil/17470342#ulei-servodirectie', 'autodoc24', 'directie'),
('Paleta ventilator racire motor BMW Seria 5 (E34) 520 i 24V benzina 150 cai FEBI BILSTEIN 22062', '22062', 160.00, 'https://www.epiesa.ro/produse_2024_4/101/22062_1.jpg', 'https://www.epiesa.ro/paleta-ventilator-racire-motor-bmw-seria-5-e34-520-i-24v-benzina-150-cai-febi-bilstein-22062/238/100337/epsroprdt-1766637/', 'epiesa', 'racire'),
('FEBI BILSTEIN 22062 Paleta ventilator, racire motor', '22062', 148.49, 'https://cdn.autodoc.de/thumb?id=1879748&m=0&n=0&lng=ro&rev=94077948', 'https://www.autodoc24.ro/febi-bilstein/1879748', 'autodoc24', 'racire'),
('Radiator racire motor BMW Seria 5 (E34) 520 i 24V benzina 150 cai MAXGEAR AC263862', 'AC263862', 496.00, 'https://www.epiesa.ro/produse_2024_4/403/5901619528402_large.jpg', 'https://www.epiesa.ro/radiator-racire-motor-bmw-seria-5-e34-520-i-24v-benzina-150-cai-maxgear-ac263862/238/100103/epsroprdt-3929237/', 'epiesa', 'racire'),
('MAXGEAR AC263862 Radiator, racire motor', 'AC263862', 630.50, 'https://cdn.autodoc.de/thumb?id=10616001&m=0&n=0&lng=ro&rev=94077948', 'https://www.autodoc24.ro/maxgear/10616001?search=MAXGEAR+Radiator%2C+racire+motor+%28AC263862%29', 'autodoc24', 'racire'),
('Pompa de apa BMW Seria 5 (E34) 520 i 24V benzina 150 cai MAXGEAR 47-0002', '47-0002', 163.00, 'https://www.epiesa.ro/produse_2024_4/403/mgc-5025_1_large.jpg', 'https://www.epiesa.ro/pompa-de-apa-bmw-seria-5-e34-520-i-24v-benzina-150-cai-maxgear-47-0002/238/100091/epsroprdt-3908388/', 'epiesa', 'racire'),
('MAXGEAR 47-0002 Pompa apa', '47-0002', 202.50, 'https://cdn.autodoc.de/thumb?id=9783931&m=0&n=0&lng=ro&rev=94077948', 'https://www.autodoc24.ro/maxgear/9783931', 'autodoc24', 'racire'),
('Termostat lichid racire BMW Seria 5 (E34) 520 i 24V benzina 150 cai MAXGEAR 67-0014', '67-0014', 53.00, 'https://www.epiesa.ro/produse_2024_4/403/67-0014_1_large.jpg', 'https://www.epiesa.ro/termostat-lichid-racire-bmw-seria-5-e34-520-i-24v-benzina-150-cai-maxgear-67-0014/238/100095/epsroprdt-3918643/', 'epiesa', 'racire'),
('MAXGEAR 67-0014 Termostat, lichid racire', '67-0014', 76.49, 'https://cdn.autodoc.de/thumb?id=10093625&m=0&n=0&lng=ro&rev=94077948', 'https://www.autodoc24.ro/maxgear/10093625', 'autodoc24', 'racire'),
('Flansa lichid racire BMW Seria 5 (E34) 520 i 24V benzina 150 cai AIC 54402', '54402', 179.00, 'https://www.epiesa.ro/produse_2024_4/6558/54402a.jpg', 'https://www.epiesa.ro/flansa-lichid-racire-bmw-seria-5-e34-520-i-24v-benzina-150-cai-aic-54402/238/100840/epsroprdt-1018322/', 'epiesa', 'racire'),
('AIC 54402 Flansa lichid racire pentru BMW Seria 3, Seria 5, Z3', '54402', 158.49, 'https://cdn.autodoc.de/thumb?id=16112082&m=0&n=0&lng=ro&rev=94077948', 'https://www.autodoc24.ro/aic/16112082?search=AIC+Flansa+lichid+racire+%2854402%29', 'autodoc24', 'racire');

