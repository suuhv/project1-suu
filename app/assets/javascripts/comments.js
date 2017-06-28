$(document).ready(function(){
  $('.new_comment').submit(function(event) {
    event.preventDefault();
    var self = $(this);
    var params = self.serialize();
    $.ajax({
      url: self.attr('action'),
      type: 'post',
      dataType: 'json',
      data: params,
    })
    .done(function(response) {
      $('.ds').append(response.html);
      $('.comment-field').val('');
    })
    .fail(function() {
      console.log('error');
    })
    .always(function() {
      console.log('complete');
    });
    return false;
  });

  $("body").on('click','.delete',function(event){
  event.preventDefault();
  var ok = $(this);
    $.ajax({
      type: ok.attr('data-method'),
      url: ok.attr('href'),
      data: {},
      dataType: 'json',
      success: function (response) {
        if (response.status == 'success') {
          ok.closest('.content-ls').fadeOut('normal');
        }
      },
      error: function (xhr, ajaxOptions, thrownError) {
        console.log('error...', xhr);
      },
      complete: function () {
      }
    });
    return false;
  });
});
