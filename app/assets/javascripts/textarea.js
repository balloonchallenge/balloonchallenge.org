$(document).on('page:load', init);
$(document).ready(init);

function init() {
    textareaPlaceholder();
}

function textareaPlaceholder() {
    NodeList.prototype.forEach = Array.prototype.forEach;
    if(document.querySelector('textarea')) {
        document.querySelectorAll('textarea').forEach(function(textarea) {
                textarea.value = textarea.dataset.placeholder;
                textarea.addEventListener('click', function(e){
                        textarea.value = '';
                });
        });
    }
}
