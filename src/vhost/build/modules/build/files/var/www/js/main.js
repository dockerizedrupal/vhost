(function($) {
  $(function() {
    var latest_version = function($context) {
      $context.each(function() {
        var self = this;

        var version_file = $(self).attr('data-version-file');

        if (!version_file) {
          return;
        }

        $.ajax({
          url: version_file,
          success: function(version) {
            version = $.trim(version);

            if (!version) {
              return;
            }

            var $latest_version = $(self);
            var $current_version = $latest_version.prev();

            if (version === $('.version', $current_version).html()) {
              var $label = $('.label', $current_version);

              $label.removeClass('label-warning');
              $label.addClass('label-success');
            }
            else {
              $current_version.hide();
              $latest_version.show();
            }
          }
        });
      });
    };

    latest_version($('.latest-version'));

    $('.nav-pills a').first().trigger('click');

    var filter = function() {
      $('.nav-pills li').each(function() {
        $(this).show();

        if ($(this).find('a').text().toLowerCase().indexOf($('#filter').val().toLowerCase()) < 0) {
          $(this).hide();
        }
      });
    };

    $('#filter').keyup(function() {
      filter();
    });
  });
})(jQuery);
