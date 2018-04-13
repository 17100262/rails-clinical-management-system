// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require Chart.bundle.min
//= require cocoon
//= require jquery-ui
//= require toastr
//= require cable
//= require datatables.min
//= require Chart.min
//= require chart-demo
//= require icheck.min
//= require jasny-bootstrap.min
//= require_tree .

$(document).ready(function() {
   $('.alert').delay(2000).fadeOut();
});
    
    // var users_table = null;
    
    //     users_table = $('.user-list table').DataTable()
        
    
        
    
    //   if ($('.user-list table').length == 1)
    //     users_table.destroy()
   
     
     
     $(document).ready(function () {
    
// $('#yes_neoadjuvant_systemic_treatment').on('change', function() {
    
//      $('.show-radio').show(); 
    // $("input[type='date']").datepicker({format: 'dd/mm/yyyy'});
    $(".date").datepicker({dateFormat: 'dd/mm/yy'});
    
// });
});


        function checks(){
        
            
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });
            
        }
        $(document).click(function(){
        checks();
         
     });
     $(document).ready(function(){
        checks();
         
     });
            
            

       $(".inbx-tr").click(function(){
       window.location=$(this).find("td a").attr("href"); 
       return false;
      });
      $(document).ready(function(){
            $('.user-list table').DataTable({
                 "aaSorting": [ ],
                pageLength: 10,
                responsive: true,
 
            });

        
    

            $('.project-list table').DataTable({
                pageLength: 10,
                responsive: true,
            
                
            });

        });
 function actions3() {        
 $("table th").each(function() {
        var cellText = $(this).text();
        if (cellText.length == 0) {
            $(this).html('');
            $(this).css('pointer-events','none');
             if($(this).hasClass('sorting_asc')){
            $(this).removeClass('sorting_asc');
        }
        else if($(this).hasClass('sorting')){
            $(this).removeClass('sorting');
        }  
        else if($(this).hasClass('sorting_desc')){
            $(this).removeClass('sorting_desc');
        }  
        }
    });
     
 }
     
    function actions() {

     $("table th.actions").each(function() {
        $(this).css('pointer-events','none');
            if($(this).hasClass('sorting_asc')){
            $(this).removeClass('sorting_asc');
        }
        else if($(this).hasClass('sorting')){
            $(this).removeClass('sorting');
        }  
        else if($(this).hasClass(' sorting_desc')){
            $(this).removeClass('sorting_desc');
        }  
                
    });
    
    }

    $(document).click(function(){
        actions();
         actions3();
         
     });
     $(document).ready(function(){
        actions();
        actions3();
     });





