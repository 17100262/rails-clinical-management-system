// App.notification = App.cable.subscriptions.create "NotificationChannel",
//   connected: ->
//     # Called when the subscription is ready for use on the server

//   disconnected: ->
//     # Called when the subscription has been terminated by the server

//   received: (data) ->
//     # Called when there's incoming data on the websocket for this channel



$(document).ready(function(){
    var initialize = false;
    
    if (! initialize){
        var data = $('#footer_user').data('user');
        // alert();
        // alert(data);
        App.notification = App.cable.subscriptions.create({channel: "NotificationChannel", user_id: data},{
         
            connected: function(){
                // toastr.info('NotificationChannel connected');
                // alert("Connected");
                
                
            },
            disconnected: function(){
                
            },
            received: function(data) {
                // body...
                // alert(data);
                // $('#message_content').val('');
                // $('#messages').append(data);
                toastr.info(data);
                // $('#notification_dropdown').prepend(data);
                
            },
        });
        initialize = true;
    }
});
