$(document).ready(function() {
    $('a[data-toggle]').on('click', function(e) {
        e.preventDefault();                     // prevent navigating
        var selector = $(this).data('toggle');  // get corresponding element
        $('div.content-border').hide();
        $(selector).show();
    });
});
