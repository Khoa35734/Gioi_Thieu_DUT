<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .splide__slide {
        position: relative;
    }
    .slide-caption {
        position: absolute;
        bottom: 10%;
        left: 50%;
        transform: translateX(-50%);
        color: white;
        background-color: rgba(0, 0, 0, 0.5);
        padding: 20px 40px;
        border-radius: 8px;
        text-align: center;
        max-width: 80%;
    }
    .slide-caption h2 {
        margin: 0;
        font-size: 2.5rem;
        font-weight: 700;
        text-shadow: 2px 2px 4px rgba(0,0,0,0.7);
    }
    .slide-caption p {
        margin: 5px 0 0;
        font-size: 1.2rem;
    }
</style>

<section id="image-slider" class="splide" aria-label="Hình ảnh nổi bật của trường">
    <div class="splide__track">
        <ul class="splide__list">
            <li class="splide__slide">
                <img src="${pageContext.request.contextPath}/assets/img/slider/slide1.jpg" alt="Toàn cảnh Trường Đại học Bách Khoa Đà Nẵng">
                <div class="slide-caption">
                    <h2>Đào tạo Kỹ sư Chất lượng cao</h2>
                    <p>Tiên phong trong đổi mới và hội nhập quốc tế</p>
                </div>
            </li>
            <li class="splide__slide">
                <img src="${pageContext.request.contextPath}/assets/img/slider/slide2.jpg" alt="Sinh viên trong phòng thí nghiệm hiện đại">
                <div class="slide-caption">
                    <h2>Nghiên cứu Khoa học & Sáng tạo</h2>
                    <p>Môi trường năng động cho các ý tưởng đột phá</p>
                </div>
            </li>
            <li class="splide__slide">
                <img src="${pageContext.request.contextPath}/assets/img/slider/slide3.jpg" alt="Hoạt động ngoại khóa của sinh viên">
                <div class="slide-caption">
                    <h2>Môi trường học tập Năng động</h2>
                    <p>Phát triển toàn diện kỹ năng và kiến thức</p>
                </div>
            </li>
        </ul>
    </div>
</section>
