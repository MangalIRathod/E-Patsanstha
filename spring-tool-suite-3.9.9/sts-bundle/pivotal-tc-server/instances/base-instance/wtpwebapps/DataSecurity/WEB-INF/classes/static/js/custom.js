(function ($) {
    "use strict";

    // metisMenu 
$("#sidebar_menu").metisMenu();
// metisMenu 
$("#admin_profile_active").metisMenu();
	
$(".open_miniSide").click(function () {
    $(".sidebar").toggleClass("mini_sidebar");
    $(".main_content ").toggleClass("full_main_content");
    $(".footer_part ").toggleClass("full_footer");
  });
$(window).on('scroll', function () {
	var scroll = $(window).scrollTop();
	if (scroll < 400) {
    $('#back-top').fadeOut(500);
	} else {
    $('#back-top').fadeIn(500);
	}
});

// back to top 
$('#back-top a').on("click", function () {
    $('body,html').animate({
      scrollTop: 0
    }, 1000);
    return false;
  });


// PAGE ACTIVE 
$( "#sidebar_menu" ).find( "a" ).removeClass("active");
$( "#sidebar_menu" ).find( "li" ).removeClass("mm-active");
$( "#sidebar_menu" ).find( "li ul" ).removeClass("mm-show");

var current = window.location.pathname
$("#sidebar_menu >li a").filter(function() {

    var link = $(this).attr("href");
    if(link){
        if (current.indexOf(link) != -1) {
            $(this).parents().parents().children('ul.mm-collapse').addClass('mm-show').closest('li').addClass('mm-active');
            $(this).addClass('active');
            return false;
        }
    }
});


    // niceSelect 
    var niceSelect = $('.nice_Select');
    if (niceSelect.length) {
        niceSelect.niceSelect();
    };

    var niceSelect = $('.nice_Select2');
    if (niceSelect.length) {
        niceSelect.niceSelect();
    };

    var niceSelect = $('.default_sel');
    if (niceSelect.length) {
        niceSelect.niceSelect();
    };


    // datepicker 
    $(document).ready(function() {
        var date_picker = $('#start_datepicker');
        if(date_picker.length){
            date_picker.datepicker();
        }

        var date_picker = $('#end_datepicker');
        if(date_picker.length){
            date_picker.datepicker();
        }
    });



   

    //active sidebar
    $('.sidebar_icon').on('click', function(){
        $('.sidebar').toggleClass('active_sidebar');
    });
    $('.sidebar_close_icon i').on('click', function(){
        $('.sidebar').removeClass('active_sidebar');
    });
    
    //active menu
    $('.troggle_icon').on('click', function(){
        $('.setting_navbar_bar').toggleClass('active_menu');
    });

   ;

    $('.custom_select').click( function(){
        if ( $(this).hasClass('active') ) {
            $(this).removeClass('active');
        } else {
            $('.custom_select.active').removeClass('active');
            $(this).addClass('active');    
        }
    });
;

    $(document).click(function(event){
        if (!$(event.target).closest(".custom_select").length) {
            $("body").find(".custom_select").removeClass("active");
        }
    });
    //remove sidebar
    $(document).click(function(event){
        if (!$(event.target).closest(".sidebar_icon, .sidebar").length) {
            $("body").find(".sidebar").removeClass("active_sidebar");
        }
    });
    
   
  if ($('.lms_table_active2').length) {
    $('.lms_table_active2').DataTable({
        bLengthChange: true,
        "bDestroy": true,
        language: {
            search: "<i class='ti-search'></i>",
            searchPlaceholder: 'Quick Search',
            paginate: {
                next: "<i class='ti-arrow-right'></i>",
                previous: "<i class='ti-arrow-left'></i>"
            }
        },
        columnDefs: [{
            visible: false
        }],
        dom: 'Bfrtip',
        buttons: [
            'excelHtml5'
         ],

        responsive: true,
        searching: false,
        info: true,
        paging: true
    });
}

$('#example').DataTable( {
          language: {
              paginate: {
                  next: "<i class='ti-arrow-right'></i>",
                  previous: "<i class='ti-arrow-left'></i>"
              }
          },
          dom: 'Bfrtip',
             buttons: [
              'pageLength', 'excel'
          ],
          responsive: true
      });

      $('[data-toggle="tooltip"]').tooltip();


}(jQuery));



