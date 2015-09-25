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

              $label.removeClass('label-info');
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

    $('.password').each(function() {
      for (var i = 0; i < $(this).html().length; i++) {
        $(this).hide().parent().find('.asterisk').append('<i class="fa fa-asterisk"></i>');
      }
    });

    $('.password').on('click', function(e) {
      e.preventDefault();

      $(this).hide().parent().find('.asterisk').show();
    });

    $('.asterisk').on('click', function(e) {
      e.preventDefault();

      $(this).hide().parent().find('.password').show();
    });

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

    $('.nav-pills a').first().trigger('click');

    $('[data-toggle="tooltip"]').tooltip();
  });
})(jQuery);
