$(document).on('page:load', init);
$(document).ready(init);

function init(){
    if($('.image')) {
        $('.slideshow').slick();
    }
    if($('.gallery').innerHTML.length > 0) {
        $('.slider-for').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            fade: true,
            asNavFor: '.slider-nav'
        });
        $('.slider-nav').slick({
            slidesToShow: 3,
            slidesToScroll: 1,
            asNavFor: '.slider-for',
            dots: true,
            centerMode: true,
            focusOnSelect: true
        });
    }
}
