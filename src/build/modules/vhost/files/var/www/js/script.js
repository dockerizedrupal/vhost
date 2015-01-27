(function($) {
  $(function() {
    setInterval(function() {
      $('#page').load(location.href + ' #page > *');
    }, 1000);
  });
})(jQuery);
