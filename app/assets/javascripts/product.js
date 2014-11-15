$(document).on('page:load', init);
$(document).ready(init);

function init(){
    if($('.image')) {
        $('.slideshow').slick();
    }
    NodeList.prototype.forEach = Array.prototype.forEach;
    document.querySelectorAll('a[href="#"]')
        .forEach(function(link){
                link.addEventListener('click', function(e) {
                        e.preventDefault();
                        alert('Looks like this isn\'t ready yet, but it\'ll be up soon. Stay tuned!');
                });
        });
}
