(function($) {
  $(function() {
    setInterval(function() {
      $('body').load(location.href + ' body');
    }, 1000);
  });
})(jQuery);
