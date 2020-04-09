$(document).on('turbolinks:load', function() {
    "use strict"; // Start of use strict
    if ($( window ).width() < 768) {
        $("body").toggleClass("sidebar-toggled");
        $(".sidebar").toggleClass("toggled");
        $('.sidebar .collapse').collapse('hide');
    };
  
      
  
  
  }); // End of use strict
  

