
$(document).ready(() => {
    let form = $("#comment-form");

    form.submit(function(e) {
        e.preventDefault();
        let data = 'text=' + $("#comment-text").val();
        $.ajax({
            type: "POST",
            url: document.URL + "/comment",
            beforeSend: function(xhr) {
                xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
            },
            data: data,
            success: function() {
                $('#comment-text').val("");
                $('#comment-form').append("<div id='message'></div>");
                $('#message').append("<p>Комментарий был добавлен.</p>")
                             .hide()
                             .fadeIn(1500, function() {
                                setTimeout(function(){
                                if ($('#message').length > 0) {
                                  $('#message').remove();
                                }
                              }, 3000)})
                             
            },
            error: function(jqXHR, exception) {
                alert("Ошибка");
            }
        });
    })
});