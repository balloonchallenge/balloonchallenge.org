$(document).on('page:load', init);
$(document).ready(init);

function init(){
    if($('.image')) {
           $('.slideshow').slick();
    }
}
