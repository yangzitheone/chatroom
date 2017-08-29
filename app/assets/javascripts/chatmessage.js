function updatechatview(data)
{
    var msgcomment=document.getElementsByName("send_msg")
    if(data['roomid']==($("#room_id").val())&&data['userid']!=($("#user_id").val()))
         // $("#chatmessages").append("<span>"+data['username']+" say :"+data['message']+"</span><br>");
         $("#chatmessages").append("<h5>" + data['created_at']+"  "+data['username'] + " say " +"<br></h5><span><h4>"+data['message']+"<h4></span>");

    $(`#${data.roomid}`).attr("src","https://robohash.org/4.png?set=set4");
     moveToBottom();
    // location.reload();
}
$(window).on('load',function() {
     moveToBottom();
});

function moveToBottom() {
      // $("#chatmessages").scrollTop($("#chatmessages")[0].scrollHeight)
}