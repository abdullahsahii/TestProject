// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
// import "select2"
import "@hotwired/turbo-rails"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


$(document).ready(function() {
    $('#live_search').on('input', function() {
        var input = $(this).val();
        if (input !== "") {
            $.ajax({
                url: "/characters/search",
                method: "get",
                data: { q: input },
                success: function(data) {
                    $("#index_content").html(data);
                }
            });
        } else {
            $("#index_content");
        }
    });
});



$(document).ready(function() {
    $('#livee_search').on('input', function() {
        var input = $(this).val();
        if (input !== "") {
            $.ajax({
                url: "/profiles/search",
                method: "get",
                data: { q: input },
                success: function(data) {
                    $("#index_content").html(data);
                }
            });
        } else {
            $("#index_content").html("");
        }
    });
});