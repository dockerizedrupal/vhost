(function($) {
  $(function() {
    $('#filter').val($.localStorage.get('filter'));

    var filter = function() {
      $.localStorage.set('filter', $('#filter').val());

      $('.panel-group').each(function() {
        $(this).show();

        if ($(this).find('h2').text().toLowerCase().indexOf($('#filter').val().toLowerCase()) < 0) {
          $(this).hide();
        }
      });
    };

    $('#filter').keyup(function() {
      filter();
    });

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
      $('#content').load(location.href + ' #content > *', function() {
        keep_panels_open();
        filter();
      });
    }, 1000);

    keep_panels_open();
    filter();
  });
})(jQuery);
