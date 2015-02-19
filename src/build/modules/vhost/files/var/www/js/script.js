(function($) {
  $(function() {
    $(document).on('show.bs.collapse', '.panel-collapse', function() {
      $.localStorage.set($(this).attr('id'), 1);
    });

    $(document).on('hide.bs.collapse', '.panel-collapse', function() {
      $.localStorage.set($(this).attr('id'), 0);
    });

    var keep_panels_open = function() {
      $('.panel-collapse').each(function() {
        if ($.localStorage.get($(this).attr('id'))) {
          $('#' + $(this).attr('id')).collapse('show');
        }
      });
    };

    setInterval(function() {
      $('#page').load(location.href + ' #page > *', function() {
        keep_panels_open();
      });
    }, 1000);

    keep_panels_open();
  });
})(jQuery);
