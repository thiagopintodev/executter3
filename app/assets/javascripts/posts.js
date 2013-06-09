// https://github.com/rails/turbolinks#events

$(document).ready(ready);
$(document).on('page:load', ready);

function ready() {
  
  $('.post .reply-trigger').on('focus', function() {
    $(this).fadeOut().closest('.post').find('.reply-box').fadeIn().find('textarea').focus();
  })

}
