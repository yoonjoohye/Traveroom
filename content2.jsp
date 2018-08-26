
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
div#label{
	margin-left:20%;
	margin-right:20%;
	margin-bottom:20px;
	font-size:20pt;
	font-weight:bold;
	font-family: 'Nanum Gothic Coding', monospace;
	color:#555555;
}
div#form1{
	margin-left:20%;
	margin-right:20%;
	text-align:center;
	font-family: 'Nanum Gothic Coding', monospace;
	color:gray;
}

figure.snip1384 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  float: left;
  overflow: hidden;
  width: 19.2%;
  height:300px;
  color: #ffffff;
  text-align: left;
  font-size: 16px;
  background-color: #000000;
  margin:3px;
}
figure.snip1384 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
figure.snip1384 img {
  width: 100%;
  height:100%;
  backface-visibility: hidden;
  vertical-align: top;
  background-size: cover;
}
figure.snip1384:after,
figure.snip1384 figcaption {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
}
figure.snip1384:after {
  content: '';
  background-color: rgba(0, 0, 0, 0.65);
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
  opacity: 0;
}
figure.snip1384 figcaption {
  z-index: 1;
  padding: 40px;
}
figure.snip1384 h3,
figure.snip1384 .links {
  width: 100%;
  margin: 5px 0;
  padding: 0;
}
figure.snip1384 h3 {
  line-height: 1.1em;
  font-weight: 700;
  font-size: 1.4em;
  text-transform: uppercase;
  opacity: 0;
}
figure.snip1384 p {
  font-size: 0.8em;
  font-weight: 300;
  letter-spacing: 1px;
  opacity: 0;
  top: 50%;
  -webkit-transform: translateY(40px);
  transform: translateY(40px);
}
figure.snip1384 i {
  position: absolute;
  bottom: 10px;
  right: 10px;
  padding: 20px 25px;
  font-size: 34px;
  opacity: 0;
  -webkit-transform: translateX(-10px);
  transform: translateX(-10px);
}
figure.snip1384 a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1;
}
figure.snip1384:hover img,
figure.snip1384.hover img {
  zoom: 1;
  filter: alpha(opacity=50);
  -webkit-opacity: 0.5;
  opacity: 0.5;
}
figure.snip1384:hover:after,
figure.snip1384.hover:after {
  opacity: 1;
  position: absolute;
  top: 10px;
  bottom: 10px;
  left: 10px;
  right: 10px;
}
figure.snip1384:hover h3,
figure.snip1384.hover h3,
figure.snip1384:hover p,
figure.snip1384.hover p,
figure.snip1384:hover i,
figure.snip1384.hover i {
  -webkit-transform: translate(0px, 0px);
  transform: translate(0px, 0px);
  opacity: 1;
}
</style>
<div id="label">가볼만한 여행장소</div>
<div id="form1">
<figure class="snip1384">
  <img src="img/seoul.png" />
  <figcaption>
    <h3>수도권</h3>
    <p>한국인들이 꼭 가볼만한 여행지</p>
    <i class="ion-ios-arrow-right"></i>
  </figcaption>
  <a href="parsing.jsp?re=수도권"></a>
</figure>

<figure class="snip1384">
  <img src="img/a.jpg" />
  <figcaption>
    <h3>강원권</h3>
    <p>한국인들이 꼭 가볼만한 여행지</p>
    <i class="ion-ios-arrow-right"></i>
  </figcaption>
  <a href="parsing.jsp?re=강원권"></a>
</figure>

<figure class="snip1384">
  <img src="img/choong.jpg" />
  <figcaption>
    <h3>충청권</h3>
    <p>한국인들이 꼭 가볼만한 여행지</p>
    <i class="ion-ios-arrow-right"></i>
  </figcaption>
  <a href="parsing.jsp?re=충청권"></a>
</figure>

<figure class="snip1384">
  <img src="img/jeon.jpg" />
  <figcaption>
    <h3>전라권</h3>
    <p>한국인들이 꼭 가볼만한 여행지</p>
    <i class="ion-ios-arrow-right"></i>
  </figcaption>
  <a href="parsing.jsp?re=전라권"></a>
</figure>

<figure class="snip1384">
  <img src="img/jinju.png" />
  <figcaption>
    <h3>경상권</h3>
    <p>한국인들이 꼭 가볼만한 여행지</p>
    <i class="ion-ios-arrow-right"></i>
  </figcaption>
  <a href="parsing.jsp?re=경상권"></a>
</figure>

</div>
