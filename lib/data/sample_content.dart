import '../models/artikel.dart';

/// Data awal (seed) untuk ensiklopedia Rumah Gadang & Ukiran Minangkabau.
/// Konten dirangkum dan ditulis ulang dari berbagai sumber budaya
/// (Tambo Alam Minangkabau, jurnal ragam hias, artikel filosofi adat).
/// Sebelum rilis publik, disarankan tetap divalidasi oleh budayawan/
/// pemangku adat setempat agar akurat dan sesuai konteks nagari masing-masing.
/// Lengkapi juga gambarAsset dengan foto/ilustrasi asli di assets/images/.
List<Artikel> sampleArtikelList() {
  return [
    Artikel(
      judul: 'Sejarah Rumah Gadang',
      kategori: 'Rumah Gadang',
      ringkasan: 'Asal-usul dan makna rumah adat Minangkabau.',
      kontenLengkap:
          'Nama "Rumah Gadang" berarti "Rumah Besar", namun kata "besar" di sini '
          'lebih merujuk pada kedudukannya yang agung dalam adat, bukan sekadar '
          'ukuran fisiknya. Rumah ini juga dikenal dengan sebutan Rumah Bagonjong '
          '(karena atapnya yang melengkung) atau Rumah Baanjuang.\n\n'
          'Rumah Gadang adalah rumah adat suku Minangkabau yang menjadi simbol '
          'garis keturunan matrilineal: rumah ini diwariskan turun-temurun '
          'melalui garis ibu, dan dihuni bersama oleh satu kaum (keluarga besar) '
          'dari garis keturunan yang sama. Karena kedudukannya yang dimuliakan, '
          'Rumah Gadang menjadi pusat berbagai kegiatan adat seperti musyawarah '
          'kaum, upacara pernikahan, hingga pertemuan keluarga besar.\n\n'
          'Semakin besar dan indah ukiran yang menghiasi sebuah Rumah Gadang, '
          'semakin tinggi pula status sosial keluarga yang memilikinya di '
          'tengah masyarakat.',
      gambarAsset: 'assets/images/rumah_gadang_sejarah.jpg',
    ),
    Artikel(
      judul: 'Filosofi Atap Gonjong',
      kategori: 'Struktur',
      ringkasan: 'Makna bentuk atap runcing menyerupai tanduk kerbau.',
      kontenLengkap:
          'Ciri paling menonjol dari Rumah Gadang adalah atapnya yang menjulang '
          'dan melengkung tajam di kedua ujungnya, disebut gonjong. Bentuk ini '
          'terinspirasi dari tanduk kerbau, merujuk pada legenda pertarungan '
          'kerbau dalam Tambo Alam Minangkabau yang menjadi asal-usul nama '
          '"Minangkabau" itu sendiri. Gonjong melambangkan kemenangan dan '
          'semangat juang masyarakatnya.\n\n'
          'Selain nilai simbolis, gonjong tunggal pada bagian serambi '
          'melambangkan hubungan vertikal antara manusia dengan Sang Pencipta, '
          'sementara gonjong di sisi kiri dan kanan menyimbolkan keseimbangan '
          'antara mikrokosmos (manusia) dan makrokosmos (alam semesta) — '
          'sejalan dengan falsafah hidup Minangkabau "Alam Takambang Jadi Guru" '
          '(alam terkembang menjadi guru).\n\n'
          'Secara fungsional, bentuk atap yang melengkung tajam juga membantu '
          'air hujan tropis mengalir turun dengan cepat, sehingga atap yang '
          'dahulu terbuat dari ijuk tidak mudah lapuk.',
      gambarAsset: 'assets/images/atap_gonjong.jpg',
    ),
    Artikel(
      judul: 'Struktur & Tiang Rumah Gadang',
      kategori: 'Struktur',
      ringkasan: 'Pembagian ruang dan cara tiang menahan gempa.',
      kontenLengkap:
          'Tiang-tiang Rumah Gadang sengaja dibuat sedikit miring condong ke '
          'dalam, bukan tegak lurus, sehingga badan rumah melebar ke arah atas '
          'membentuk semacam trapesium terbalik. Kemiringan ini justru '
          'menambah kekokohan bangunan menghadapi guncangan.\n\n'
          'Berbeda dari bangunan modern, tiang-tiang ini tidak ditanam ke '
          'dalam tanah, melainkan hanya bertumpu di atas batu datar (disebut '
          'umpak). Dengan begitu, saat terjadi gempa, seluruh badan rumah bisa '
          'bergeser mengikuti arah getaran alih-alih menahannya secara kaku.\n\n'
          'Di bagian dalam, Rumah Gadang umumnya tidak memiliki kamar-kamar '
          'tertutup penuh seperti rumah modern. Ruang dibagi menurut fungsi '
          'adat: ruang tengah digunakan untuk musyawarah kaum, sementara '
          'anjuang (bagian ruang yang sedikit ditinggikan) biasa digunakan '
          'untuk perempuan atau pengantin dalam upacara adat. Pembagian ruang '
          'yang terbuka ini mencerminkan nilai demokrasi dan musyawarah yang '
          'dijunjung tinggi masyarakat Minangkabau.',
      gambarAsset: 'assets/images/struktur_ruang.jpg',
    ),
    Artikel(
      judul: 'Ukiran Kaluak Paku',
      kategori: 'Ukiran',
      ringkasan: 'Motif ukiran terinspirasi lekukan daun pakis muda.',
      kontenLengkap:
          'Kaluak Paku menggambarkan lekuk pucuk tanaman paku (pakis) yang '
          'melengkung khas. Motif ini mengandung pesan bahwa manusia harus '
          'belajar mawas diri sejak kecil, dan pendidikan dalam keluarga '
          'menjadi bekal utama sebelum seseorang terjun bergaul di tengah '
          'masyarakat.\n\n'
          'Dengan bekal nilai yang kuat dari keluarga, seseorang diharapkan '
          'tumbuh menjadi pribadi yang teguh dan tidak mudah terpengaruh hal '
          'negatif ketika sudah hidup mandiri di tengah masyarakat luas.',
      gambarAsset: 'assets/images/ukiran_kaluak_paku.jpg',
    ),
    Artikel(
      judul: 'Ukiran Itiak Pulang Patang',
      kategori: 'Ukiran',
      ringkasan: 'Motif barisan itik pulang menjelang senja.',
      kontenLengkap:
          'Motif ini terinspirasi dari kebiasaan itik yang berbaris rapi '
          'pulang ke kandang menjelang petang setelah seharian mencari makan, '
          'kembali dalam keadaan kenyang secukupnya tanpa mengambil lebih '
          'dari yang dibutuhkan.\n\n'
          'Filosofinya mengajarkan pentingnya hidup sederhana, bersyukur, dan '
          'tidak berlebihan (tidak serakah) dalam mengelola apa yang dimiliki. '
          'Barisan itik yang rapi dan seirama juga melambangkan kekompakan '
          'serta kepatuhan terhadap aturan bersama — hidup yang seiya sekata '
          'dan rukun dalam bermasyarakat.',
      gambarAsset: 'assets/images/ukiran_itiak_pulang_patang.jpg',
    ),
    Artikel(
      judul: 'Ukiran Bada Mudiak',
      kategori: 'Ukiran',
      ringkasan: 'Motif ikan bada berenang menyongsong air jernih.',
      kontenLengkap:
          'Bada adalah sebutan untuk ikan-ikan kecil, dan "mudiak" berarti '
          'bergerak ke arah hulu sungai. Motif ini menggambarkan gerombolan '
          'ikan bada yang berenang bersama menuju hulu, menyongsong air yang '
          'lebih jernih, bergerak searah tanpa saling mendahului atau saling '
          'menyikut satu sama lain.\n\n'
          'Falsafah ini menjadi lambang pergaulan bermasyarakat yang rukun, '
          'serasi, dan seiya sekata menuju arah serta tujuan yang sama. Gerak '
          'ikan menuju hulu juga bisa dimaknai sebagai ajakan untuk kembali '
          'ke akar suatu persoalan demi menemukan kejernihan dan kebenaran.',
      gambarAsset: 'assets/images/ukiran_bada_mudiak.jpg',
    ),
    Artikel(
      judul: 'Ukiran Pucuk Rebung',
      kategori: 'Ukiran',
      ringkasan: 'Motif pucuk bambu muda yang terus tumbuh.',
      kontenLengkap:
          'Pucuk Rebung menggambarkan tunas muda bambu yang tumbuh dari '
          'rumpunnya. Motif ini melambangkan harapan agar hidup seseorang '
          'senantiasa bermanfaat sepanjang masa, sebagaimana bambu yang '
          'hampir seluruh bagiannya — dari akar, batang, hingga daun — bisa '
          'dimanfaatkan oleh manusia.\n\n'
          'Motif ini juga sering ditemukan pada songket dan kain tenun '
          'Minangkabau, menjadikannya salah satu ragam hias yang paling '
          'dikenal luas di luar konteks ukiran Rumah Gadang.',
      gambarAsset: 'assets/images/ukiran_pucuk_rebung.jpg',
    ),
    Artikel(
      judul: 'Teknik Memahat Ukiran Kayu',
      kategori: 'Teknik Pembuatan',
      ringkasan: 'Tahapan tukang ukir membuat motif pada papan kayu.',
      kontenLengkap:
          'Proses membuat ukiran Rumah Gadang umumnya melalui beberapa '
          'tahapan: pertama, tukang ukir membuat corak atau pola di atas '
          'kertas gambar; kedua, pola tersebut dipindahkan ke permukaan kayu '
          'yang akan diukir, baik dengan cara dijiplak langsung maupun '
          'disablon; ketiga, tukang ukir membentuk dasar corak dengan '
          'membersihkan ruang di antara motif, sebelum masuk ke tahap '
          'pemahatan detail dan penghalusan akhir.\n\n'
          'Seorang tukang ukir yang baik tidak hanya perlu terampil memakai '
          'alat pahat, tetapi juga harus memahami falsafah yang terkandung '
          'dalam setiap ragam ukir serta mengenal karakter bahan kayu yang '
          'digunakan. Menariknya, meski banyak motif dinamai dari makhluk '
          'hidup (seperti itik atau ikan), bentuk ukirannya sendiri tidak '
          'pernah secara harfiah menggambarkan wujud hewan atau manusia, '
          'melainkan distilisasi menjadi pola geometris dan lekukan alami.',
      gambarAsset: 'assets/images/teknik_ukir.jpg',
    ),
    Artikel(
      judul: 'Teknik Konstruksi Tanpa Paku',
      kategori: 'Teknik Pembuatan',
      ringkasan: 'Sistem pasak dan sambungan kayu tahan gempa.',
      kontenLengkap:
          'Rumah Gadang dibangun tanpa menggunakan satu pun paku atau baut '
          'logam. Sebagai gantinya, seluruh elemen kayu disatukan dengan '
          'sistem pasak (dikenal juga sebagai teknik peg-and-hole): '
          'lubang-lubang dipahat dengan presisi pada balok kayu, lalu '
          'disatukan menggunakan pasak kayu sebagai pengunci.\n\n'
          'Sambungan model ini membuat balok-balok kayu dapat bergerak '
          'terbatas seperti engsel saat terjadi gempa, sehingga struktur '
          'tidak mudah patah — berbeda dengan sambungan paku besi yang kaku. '
          'Ditambah dengan tiang yang hanya bertumpu di atas batu umpak '
          '(bukan tertanam ke tanah), seluruh bangunan menjadi lebih lentur '
          'dan mampu meredam energi guncangan.\n\n'
          'Kayu yang dipilih untuk struktur utama biasanya kayu keras seperti '
          'surian atau meranti merah, karena sifatnya yang kuat, lentur, dan '
          'tahan lapuk. Sebagai tambahan, sistem pasak ini juga memudahkan '
          'perbaikan: jika ada elemen kayu yang rusak, bagian tersebut bisa '
          'dilepas dan diganti tanpa perlu membongkar seluruh bangunan.',
      gambarAsset: 'assets/images/teknik_konstruksi.jpg',
    ),
    Artikel(
      judul: 'Ukiran Kuciang Lalok',
      kategori: 'Ukiran',
      ringkasan: 'Motif kucing tidur, peringatan agar tidak malas & rakus.',
      kontenLengkap:
          'Kuciang Lalok (kucing tidur) terinspirasi dari kebiasaan kucing '
          'peliharaan: begitu perutnya kenyang, ia hanya tidur-tiduran dan '
          'bermalas-malasan, namun jika ada makanan di depannya, tetap saja '
          'diambil meski sudah tidak lapar.\n\n'
          'Sifat inilah yang dijadikan peringatan dalam falsafah Minangkabau '
          '— manusia tidak boleh serakah, dan tidak boleh terlalu sering '
          'bermalas-malasan hanya karena kebutuhannya sudah tercukupi. Motif '
          'ini sering diukir berdampingan dengan motif Saik Galamai.',
      gambarAsset: 'assets/images/ukiran_kuciang_lalok.jpg',
    ),
    Artikel(
      judul: 'Ukiran Saik Galamai',
      kategori: 'Ukiran',
      ringkasan: 'Motif belah ketupat terinspirasi kue galamai.',
      kontenLengkap:
          'Saik Galamai berbentuk belah ketupat, terinspirasi dari potongan '
          'kue galamai (sejenis dodol atau wajik khas Minangkabau) yang '
          'biasa disajikan dalam upacara adat.\n\n'
          'Motif ini melambangkan ketelitian dan kecermatan — sebagaimana '
          'proses membuat galamai yang membutuhkan ketekunan mengaduk adonan '
          'dalam waktu lama agar hasilnya sempurna. Saik Galamai sering '
          'diukir berdampingan dengan motif Kuciang Lalok, menyampaikan '
          'pesan gabungan: manusia harus tekun berusaha dengan cara yang sah '
          'dan halal, tanpa serakah maupun bermalas-malasan.',
      gambarAsset: 'assets/images/ukiran_saik_galamai.jpg',
    ),
    Artikel(
      judul: 'Ukiran Saluak Laka',
      kategori: 'Ukiran',
      ringkasan: 'Motif jalinan lidi/rotan penyangga periuk.',
      kontenLengkap:
          'Saluak Laka menggambarkan jalinan lidi atau rotan yang saling '
          'mengikat erat untuk membentuk alas penyangga periuk atau wadah '
          'lainnya.\n\n'
          'Filosofinya mengajarkan pentingnya sikap tolong-menolong dalam '
          'hidup bermasyarakat — sebagaimana untaian lidi yang lemah bila '
          'sendiri-sendiri, tetapi menjadi kuat ketika saling berkait dan '
          'menopang satu sama lain. Semakin erat jalinan kekerabatan dan '
          'persatuan warga, semakin kokoh pula rencana bersama yang bisa '
          'diwujudkan.',
      gambarAsset: 'assets/images/ukiran_saluak_laka.jpg',
    ),
    Artikel(
      judul: 'Ukiran Jalo Taserak',
      kategori: 'Ukiran',
      ringkasan: 'Motif jala tersebar, lambang batas baik dan buruk.',
      kontenLengkap:
          'Jalo Taserak menggambarkan jala (alat penangkap ikan) yang '
          'tersebar atau terserak setelah digunakan.\n\n'
          'Motif ini melambangkan kemampuan seseorang memisahkan antara hal '
          'yang baik dan buruk, serta antara yang sah dan tidak sah dalam '
          'kehidupan bermasyarakat. Seseorang yang sudah mampu membedakan '
          'kedua hal tersebut dianggap siap hidup di tengah masyarakat tanpa '
          'tersesat pada hal-hal yang bertentangan dengan aturan adat.',
      gambarAsset: 'assets/images/ukiran_jalo_taserak.jpg',
    ),
    Artikel(
      judul: 'Ukiran Tangguak Lamah',
      kategori: 'Ukiran',
      ringkasan: 'Motif tangguk lembut, lambang rendah hati.',
      kontenLengkap:
          'Tangguak adalah alat tradisional berbentuk jaring untuk menangkap '
          'ikan di sungai atau sawah. Kata "Lamah" pada motif ini merujuk '
          'pada sifatnya yang lembut/lentur, bukan kaku.\n\n'
          'Motif Tangguak Lamah melambangkan sikap rendah hati dan sopan '
          'santun dalam bergaul — sebagaimana tangguk yang lentur mampu '
          'menyesuaikan diri mengikuti arus air tanpa patah, seseorang '
          'diharapkan mampu bersikap luwes dan tidak sombong ketika '
          'berhadapan dengan berbagai situasi di tengah masyarakat.',
      gambarAsset: 'assets/images/ukiran_tangguak_lamah.jpg',
    ),
    Artikel(
      judul: 'Ukiran Aka Cino',
      kategori: 'Ukiran',
      ringkasan: 'Motif akar bermakna keuletan hidup merantau.',
      kontenLengkap:
          'Kata "Aka" dalam bahasa Minangkabau bisa berarti akar tumbuhan, '
          'namun juga bisa berarti akal atau daya pikir. Sementara "Cino" '
          'merujuk pada Cina — bangsa yang dikenal masyarakat Minangkabau '
          'gemar merantau ke berbagai negeri.\n\n'
          'Motif ini melambangkan kedinamisan hidup yang gigih dan ulet '
          'dalam memenuhi kebutuhan hidup, sejalan dengan tradisi merantau '
          'yang mengakar kuat dalam budaya Minangkabau: seseorang yang '
          'merantau harus mengasah akal pikirannya untuk berjuang meraih '
          'tujuan hidup di negeri orang.',
      gambarAsset: 'assets/images/ukiran_aka_cino.jpg',
    ),
    Artikel(
      judul: 'Ukiran Carano Kanso',
      kategori: 'Ukiran',
      ringkasan: 'Motif wadah sirih pinang, lambang penghormatan tamu.',
      kontenLengkap:
          'Carano Kanso menggambarkan wadah tradisional dari logam (seperti '
          'loyang atau kuningan) yang digunakan untuk meletakkan '
          'perlengkapan sirih pinang secara lengkap.\n\n'
          'Motif ini melambangkan penghormatan kepada tamu: dalam adat '
          'Minangkabau, sebelum memulai pembicaraan resmi, tuan rumah '
          'terlebih dahulu menyuguhkan sirih pinang dalam carano kepada '
          'tamunya sebagai tanda menghargai kedatangan mereka.',
      gambarAsset: 'assets/images/ukiran_carano_kanso.jpg',
    ),
    Artikel(
      judul: 'Ukiran Lumuik Anyuik',
      kategori: 'Ukiran',
      ringkasan: 'Motif lumut hanyut, peringatan agar taat pada norma.',
      kontenLengkap:
          'Lumuik Anyuik (lumut hanyut) menggambarkan tumbuhan lumut yang '
          'hidup menempel pada batu atau batang kayu di air, namun mudah '
          'terlepas dan hanyut terbawa arus.\n\n'
          'Motif ini menjadi peringatan bagi masyarakat agar tidak berbuat '
          'durhaka atau melanggar norma adat, karena pelanggar bisa saja '
          '"hanyut" atau dikucilkan dari lingkungan masyarakatnya. Di sisi '
          'lain, motif ini juga mengandung makna tentang orang yang terlalu '
          'mudah menyesuaikan diri di mana pun berada — sebuah sifat yang '
          'sebenarnya berkesan kurang baik, karena menandakan seseorang '
          'tidak punya pendirian dan mudah terpengaruh orang lain.',
      gambarAsset: 'assets/images/ukiran_lumuik_anyuik.jpg',
    ),
    Artikel(
      judul: 'Ukiran Limpapeh',
      kategori: 'Ukiran',
      ringkasan: 'Motif serangga, lambang peran penting perempuan.',
      kontenLengkap:
          'Limpapeh adalah nama motif yang terinspirasi dari serangga mirip '
          'kupu-kupu namun warnanya tidak mencolok. Nama ini erat kaitannya '
          'dengan istilah adat "Limpapeh Rumah Nan Gadang" — gelar '
          'kehormatan bagi perempuan (bundo kanduang) yang menghuni Rumah '
          'Gadang.\n\n'
          'Kata pepatah adat menyebutkan: "Limpapeh rumah nan gadang, '
          'sumarak anjuang dalam nagari" (tiang tengah rumah yang besar, '
          'penyemarak anjuang di tengah nagari). Secara harfiah, limpapeh '
          'berarti tiang tengah yang menopang kekuatan bangunan Rumah '
          'Gadang — sebuah analogi untuk peran sentral perempuan (ibu) '
          'dalam menjaga keharmonisan dan keutuhan rumah tangga. Jika '
          'limpapeh runtuh, seluruh bangunan pun ikut runtuh, sebagaimana '
          'peran penting seorang ibu bagi keutuhan keluarganya.',
      gambarAsset: 'assets/images/ukiran_limpapeh.jpg',
    ),
    Artikel(
      judul: 'Ukiran Si Kambang Manih',
      kategori: 'Ukiran',
      ringkasan: 'Motif bunga mekar, lambang wanita berbudi luhur.',
      kontenLengkap:
          'Si Kambang Manih (si bunga manis/mekar) menggambarkan bunga yang '
          'sedang mekar dan terlihat sangat indah.\n\n'
          'Motif ini diumpamakan sebagai sosok perempuan yang cantik dan '
          'memiliki tingkah laku baik: sopan santun, lemah lembut, dan '
          'berbudi luhur — sebuah harapan ideal tentang bagaimana seorang '
          'perempuan Minangkabau sepatutnya bersikap di tengah masyarakat.',
      gambarAsset: 'assets/images/ukiran_si_kambang_manih.jpg',
    ),
    Artikel(
      judul: 'Ragam Rajo Tigo Selo',
      kategori: 'Ukiran',
      ringkasan: 'Ragam melambangkan tiga pemimpin & tiga bidang tanggung jawab.',
      kontenLengkap:
          'Berbeda dari kebanyakan motif lain yang terinspirasi flora atau '
          'fauna, Rajo Tigo Selo (tiga raja duduk bersila) merujuk pada '
          'sistem pembagian tanggung jawab dalam sejarah Minangkabau: Raja '
          'Alam yang berkedudukan di Pagaruyung dan bertanggung jawab atas '
          'persatuan rakyat, Raja Adat yang memegang hukum dan aturan adat, '
          'serta Raja Ibadat yang mengurus persoalan keagamaan.\n\n'
          'Ragam hias ini mengingatkan masyarakat Minangkabau akan '
          'pentingnya keseimbangan antara tiga unsur kehidupan: '
          'kepemimpinan/persatuan, hukum adat, dan agama — sejalan dengan '
          'falsafah "adat basandi syarak, syarak basandi kitabullah" (adat '
          'bersendikan agama, agama bersendikan Kitabullah).',
      gambarAsset: 'assets/images/ragam_rajo_tigo_selo.jpg',
    ),
    Artikel(
      judul: 'Ukiran Pisang Sasikek',
      kategori: 'Ukiran',
      ringkasan: 'Motif pisang seikat, lambang penyambutan tamu.',
      kontenLengkap:
          'Pisang Sasikek (pisang seikat/sesisir) dinamai dari bentuk fisik '
          'pisang yang melengkung dan tersusun rapi dalam satu ikatan.\n\n'
          'Motif ini melambangkan penyambutan tamu — pisang memang lazim '
          'disuguhkan sebagai jamuan bagi tamu yang berkunjung. Di sisi '
          'lain, motif ini juga membawa pesan bahwa suatu pekerjaan yang '
          'dikerjakan tanpa kesungguhan tidak akan membuahkan hasil maupun '
          'manfaat yang berarti.',
      gambarAsset: 'assets/images/ukiran_pisang_sasikek.jpg',
    ),
    Artikel(
      judul: 'Ukiran Buah Palo Bapatah',
      kategori: 'Ukiran',
      ringkasan: 'Motif buah pala terbelah, lambang keindahan tersembunyi.',
      kontenLengkap:
          'Buah Palo Bapatah (buah pala yang dibelah) terinspirasi dari '
          'penampang buah pala yang jika dibelah dua akan menampakkan '
          'bentuk menyerupai hati yang indah.\n\n'
          'Motif ini melambangkan bahwa sesuatu yang tampak biasa dari luar '
          'bisa saja menyimpan keindahan atau kebaikan yang tersembunyi di '
          'dalamnya — sebuah pengingat untuk tidak menilai seseorang atau '
          'sesuatu hanya dari tampilan luarnya.',
      gambarAsset: 'assets/images/ukiran_buah_palo_bapatah.jpg',
    ),
    Artikel(
      judul: 'Ukiran Aka Basaua',
      kategori: 'Ukiran',
      ringkasan: 'Motif akar bersambung, lambang persaudaraan abadi.',
      kontenLengkap:
          'Aka Basaua (akar yang saling menyambung) menggambarkan jalinan '
          'akar tumbuhan yang saling terhubung dan menyatu satu sama lain.\n\n'
          'Motif ini melambangkan tali kekerabatan dan persaudaraan yang '
          'tidak pernah putus, sejalan dengan nilai kekeluargaan yang '
          'dijunjung tinggi dalam masyarakat Minangkabau — sekali menjadi '
          'saudara atau sanak famili, ikatan itu diharapkan tetap terjaga '
          'sepanjang masa.',
      gambarAsset: 'assets/images/ukiran_aka_basaua.jpg',
    ),
    Artikel(
      judul: 'Ukiran Kudo Manyipak Dalam Kandang',
      kategori: 'Ukiran',
      ringkasan: 'Motif kuda menyepak, lambang menahan diri pada pantangan adat.',
      kontenLengkap:
          'Motif ini menggambarkan seekor kuda yang menyepak-nyepak di '
          'dalam kandang yang sempit. Dalam pantun adat yang menyertainya, '
          'digambarkan bagaimana kuda tersebut kesal dan ingin meronta, '
          'namun ruang geraknya dibatasi oleh kandang.\n\n'
          'Motif ini menjadi ibarat bagi manusia: sekesal atau semarah '
          'apapun seseorang, ia tetap harus menahan diri dan tidak '
          'melampiaskan amarahnya secara berlebihan, karena hidup '
          'bermasyarakat selalu dibatasi oleh pantangan dan aturan adat '
          'yang harus dihormati bersama.',
      gambarAsset: 'assets/images/ukiran_kudo_manyipak.jpg',
    ),
    Artikel(
      judul: 'Ukiran Sajamba Makan',
      kategori: 'Ukiran',
      ringkasan: 'Motif jamuan makan adat, lambang aturan & tata krama.',
      kontenLengkap:
          'Sajamba Makan menggambarkan suasana "makan bajamba" — tradisi '
          'makan bersama khas Minangkabau menggunakan piring besar (dulang) '
          'dengan posisi duduk saling berhadapan, biasanya diikuti empat '
          'orang dalam satu jamba.\n\n'
          'Motif ini melambangkan adanya aturan dalam melaksanakan suatu '
          'pekerjaan atau kegiatan bersama. Sebagaimana makan bajamba yang '
          'punya tata cara tersendiri (siapa mulai duluan, cara mengambil '
          'lauk, dan sebagainya), setiap kegiatan dalam hidup bermasyarakat '
          'perlu dipahami dan didalami tata caranya, karena adat adalah '
          'pedoman hidup bersama.',
      gambarAsset: 'assets/images/ukiran_sajamba_makan.jpg',
    ),
    Artikel(
      judul: 'Ukiran Siriah Gadang',
      kategori: 'Ukiran',
      ringkasan: 'Motif sirih besar, lambang kegembiraan dalam persatuan.',
      kontenLengkap:
          'Siriah (sirih) adalah tumbuhan merambat yang daunnya biasa '
          'disuguhkan bersama pinang, kapur, dan gambir dalam carano untuk '
          'membuka pertemuan adat maupun menyambut tamu. "Siriah Gadang" '
          'sendiri merujuk pada sebuah helat (perhelatan) besar yang '
          'digelar tujuh hari tujuh malam, tempat seluruh warga nagari '
          'diundang untuk membicarakan berbagai persoalan bersama.\n\n'
          'Motif ini melambangkan kegembiraan dalam persatuan, sejalan '
          'dengan pepatah adat: "Nan sakabek bak siriah, salubang bak tabu, '
          'sarumpun bak sarai" — yang bermakna seikat bagaikan sirih, '
          'selubang bagaikan tebu, serumpun bagaikan serai — sebuah '
          'gambaran tentang eratnya kekompakan dan kebersamaan warga.',
      gambarAsset: 'assets/images/ukiran_siriah_gadang.jpg',
    ),
    Artikel(
      judul: 'Ukiran Ramo-Ramo Si Kumbang Janti',
      kategori: 'Ukiran',
      ringkasan: 'Motif kupu-kupu & kumbang hijau, lambang keindahan yang tak merugikan.',
      kontenLengkap:
          'Ramo-ramo (kupu-kupu) dan si Kumbang Janti (kumbang kecil '
          'berwarna hijau mengkilat) adalah dua serangga yang sama-sama '
          'terlihat indah namun tidak merusak apa pun di sekitarnya — baik '
          'terhadap dirinya sendiri maupun lingkungan tempatnya hidup.\n\n'
          'Motif ini melambangkan harapan agar seseorang bisa hidup dengan '
          'indah dan menyenangkan bagi orang lain, tanpa merugikan atau '
          'merusak siapa pun dalam prosesnya — keindahan yang membawa '
          'manfaat, bukan kerusakan.',
      gambarAsset: 'assets/images/ukiran_ramo_ramo.jpg',
    ),
  ];
}
