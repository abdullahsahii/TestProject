// app/assets/javascripts/comments.js

$(document).on("submit", "#comment-form", function(e) {
    e.preventDefault();

    var form = $(this);
    var url = form.attr("action");
    var formData = form.serialize();

    $.ajax({
        type: "POST",
        url: url,
        data: formData,
        success: function(data) {
            // Update the comments section with the new comment
            $(".comments").append(data);
            form.trigger("reset");
        },
        error: function() {
            alert("Error adding comment.");
        }
    });
});
