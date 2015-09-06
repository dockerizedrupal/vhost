(function($) {
  $(function() {
    var latest_version = function($context) {
      var version_file = $context.attr('data-version-file');

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

          var $latest_version = $context;
          var $current_version = $latest_version.prev();

          if (version !== $('.version', $current_version).html()) {
            $current_version.hide();
            $latest_version.show();
          }
        }
      });
    };

    latest_version($('.page-header .latest-version'));

    $('.service .latest-version').each(function() {
      latest_version($(this));
    });
  });
})(jQuery);
