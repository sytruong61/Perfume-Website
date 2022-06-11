<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
	<link rel="stylesheet" href="resource/css/about.css">
	<link rel="stylesheet" href="resource/css/themify-icons/themify-icons.css">
	
	<title>Giới thiệu</title>
</head>
<body>
	<section>
      <div class="circle"></div>
      <header>
        <a href="#"><img src="resource/img/logo_111.png" class="logo"></a>
        <div class="toggle" onclick="toggleMenu()">
          <i class="ti-menu"></i>
        </div>
        <ul class="navigation">
          <li ><a href="#">Mở đầu</a></li>
          <li ><a href="#creator">Creator</a></li>
          <li ><a href="#contact">Contact</a></li>
        </ul>
      </header>

      <div class="content">
        <div class="textBox">
        	<h2 class="first-text" style="text-transform: uppercase; text-align:center;">t&l store</h2>
          <p class="first-text" style="text-align:center;">You deserve to be happy</h2>
           <a href="./user/index.htm">Trang chủ</a>
          <p style=" text-align:center;">Chào mừng các bạn đến với T and L store – một tiệm nước hoa nho nhỏ lấy cảm hứng từ những con người có cảm xúc đặc biệt biệt với hương thơm mê hoặc.</p>
         
        </div>

        <div class="imgBox">
          <!-- Swiper -->
            <div class="swiper-container">
              <div class="swiper-wrapper">
                <div class="swiper-slide"><img src="resource/img/1.png"></div>
                <div class="swiper-slide"><img src="resource/img/2.png"></div>
                <div class="swiper-slide"><img src="resource/img/3.png"></div>
                <div class="swiper-slide"><img src="resource/img/4.png"></div>

              </div>
            </div>
        </div>
      </div>


      <ul class="sci">
        <li><a href="#"><i class="ti-facebook"></i></a></li>
        <li><a href="#"><i class="ti-twitter-alt"></i></a></li>
        <li><a href="#"><i class="ti-instagram"></i></a></li>
      </ul>
    </section>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script>
          var swiper = new Swiper('.swiper-container', {
            effect: 'coverflow',
            grabCursor: true,
            centeredSlides: true,
            slidesPerView: 'auto',
            coverflowEffect: {
              rotate: 50,
              stretch: 0,
              depth: 100,
              modifier: 1,
              slideShadows: true,
            },
            pagination: {
              el: '.swiper-pagination',
            },
            loop: true
          });

          function toggleMenu(){
            const menuToggle = document.querySelector('.toggle');
            const navigation = document.querySelector('.navigation');
            menuToggle.classList.toggle('active')
            navigation.classList.toggle('active')
          }
    </script>

    <!-- INFOR -->



    <section class="section2" style="flex-direction: column;" id="creator">
      <div class="">
        <h2 class="first-text">CREATOR</h2>
      </div>
      <div class="container2">
        <div class="card2">
          <div class="content2">
            <div class="imgBx2">
              <img src="resource/img/truong.jpg" alt="">
            </div>
            <div class="contentBx2">
              <h3>NGUYỄN SỸ TRƯỜNG<br><span>N18DCAT099</span></h3>
            </div>
          </div>
          <ul class="sci2">
            <li style="--i:1"><a href="#"><i class="ti-facebook"></i></a></li>
            <li style="--i:2"><a href="#"><i class="ti-twitter-alt"></i></a></li>
            <li style="--i:3"><a href="#"><i class="ti-instagram"></i></a></li>
          </ul>
        </div>



        <div class="card2">
          <div class="content2">
            <div class="imgBx2">
              <img src="resource/img/Long.jpg" alt="">
            </div>
            <div class="contentBx2">
              <h3>VŨ ĐỨC HOÀNG KIM LONG<br><span>N18DCAT045</span></h3>
            </div>
          </div>
          <ul class="sci2">
            <li style="--i:1"><a href="#"><i class="ti-facebook"></i></a></li>
            <li style="--i:2"><a href="#"><i class="ti-twitter-alt"></i></a></li>
            <li style="--i:3"><a href="#"><i class="ti-instagram"></i></a></li>
          </ul>
        </div>
      </div>
    </section>

    <div id="contact">
    <div class="h2-contact">
        <h2>CONTACT US</h2>
      </div>
      
      
      <div class="content-contact">
      <div class="first margin-top">
        <div class="">
          <h2>T&L Store</h2>
        </div>
        <div class="">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1959.2612259929483!2d106.78490560804843!3d10.847810698068324!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317527131ae8b249%3A0x4d2d3c8fab7d3c2e!2zOTcgxJDGsOG7nW5nIE1hbiBUaGnhu4duLCBIaeG7h3AgUGjDuiwgUXXhuq1uIDksIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaCwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1621789554104!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </div>
      </div>


      <div class="Second margin-top">
        <div class="line-1 margin-bot">
          <p>ĐỊA CHỈ T&L</p>
        </div>
        <div class="line-2 margin-bot">
          <p><i class="ti-location-pin"></i>  97 Man Thiện, Hiệp Phú, Thủ Đức</p>
          <p><i class="ti-mobile"></i>  090 466 4666</p>
          <p><i class="ti-email"></i>  PTITHCM@student.edu.vn</p>
        </div>
        <div class="line-3 margin-bot">
          <p>Giờ mở cửa : thứ 2 đến thứ 7 from 8:00 to 17:30</p>
        </div>
        <ul class="ul-buttom">
        <li>
            <a href="#">
              <span></span>
              <span></span>
              <span></span>
              <span></span>
              <span class="ti-facebook"></span>
            </a>
        </li>
        <li>
            <a href="#">
              <span></span>
              <span></span>
              <span></span>
              <span></span>
              <span class="ti-twitter"></span>
            </a>
        </li>
        <li>
            <a href="#">
              <span></span>
              <span></span>
              <span></span>
              <span></span>
              <span class="ti-google"></span>
            </a>
        </li>
        <li>
            <a href="#">
              <span></span>
              <span></span>
              <span></span>
              <span></span>
              <span class="ti-linkedin"></span>
            </a>
        </li>
        <li>
            <a href="#">
              <span></span>
              <span></span>
              <span></span>
              <span></span>
              <span class="ti-instagram"></span>
            </a>
        </li>
      </ul>
      </div>
      </div>

		
    </div>
</body>
</html>