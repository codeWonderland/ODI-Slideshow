mq = window.matchMedia( "(max-width: 768px)" )
slideIndex = 0
$(document).ready ->
  dotHTML = ''
  dotHTML += '<span class="dot" onclick="showSlide(' + index + ')"></span>' for slide, index in $('.slide')
  $('#dot-component').innerHTML = dotHTML
  showSlide slideIndex
  initHammer(photo) for photo in $('.slideshow-container').find('img')
  setInterval plusSlides, 5000
  return

@initHammer = (el) ->
  mc = new Hammer.Manager(el)
  mc.add( new Hammer.Swipe() )
  mc.on 'swiperight', plusSlides(-1)
  mc.on 'swipeleft', plusSlides(1)
  return
  
@plusSlides = (n = 1) ->
  showSlides slideIndex += n
  return
  
@showSlide = (n) ->
  slideIndex = n
  slides = $('.slide')
  dots = $('.dot')
  slideIndex = 0 if slideIndex >= slides.length
  slideIndex = slides.length - 1 if slideIndex < 0
  slide.style.display = 'none' for slide, index in slides
  dot.className.replace ' active', '' for dot in dots
  slides[slideIndex].style.display = 'block'
  dots[slideIndex].className += ' active'
  return