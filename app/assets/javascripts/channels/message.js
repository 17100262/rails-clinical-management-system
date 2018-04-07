
// console.log('hello');
// console.log(chat_id);
// alert(chat_id)
var initialized = false;
$(document).ready(function(){
    var chat_id = $('#messages').data('chat_id');
    // alert(chat_id);
    if (!initialized) {
        App.message = App.cable.subscriptions.create({channel: "MessageChannel", chat_id: chat_id},{
         
            connected: function(){
                // alert("Connected");
                
                
            },
            disconnected: function(){
                
            },
            received: function(data) {
                // body...
                // alert(data);
                
                var current_user = $('#footer_user').data('user');
                // var message_sender_type = data["sender_type"]
                var message_sender_id = data["sender_id"]
                // alert(current_user);
                
                if (message_sender_id == current_user){
                    var message = "<div class='right'>" + data["message"] + "</div>"
                    // alert("right");
                    $('.content').append(message);
                }
                else {
                    
                    var message = "<div class='left'>" + data["message"] + "</div>"
                    // alert("right");
                    $('.content').append(message);
                }
                    
                
                // // toastr.info('Are you the 6 fingered man?');
                // var height = 10000000;
                // $('.chat-form-c').animate({scrollTop: height});
                
            }
          
        });
        initialized = true;
    }
        
});





// # App.message = App.cable.subscriptions.create "MessageChannel",
// #   connected: ->
// #     # Called when the subscription is ready for use on the server

// #   disconnected: ->
// #     # Called when the subscription has been terminated by the server

// #   received: (data) ->
// #     # Called when there's incoming data on the websocket for this channel

