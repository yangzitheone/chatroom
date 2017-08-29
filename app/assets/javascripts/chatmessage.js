function updatechatview(data)
{
    var msgcomment=document.getElementsByName("send_msg")
     if(data['roomid']==($("#room_id").val())&&data['userid']!=($("#user_id").val()))
    // location.reload();
    $("#chatmessages").append("<img src=\'https://robohash.org/4.png?set=set3\' width=\'18\' />"+"<span>"+data['username']+" say :"+data['message']+"</span><br>");
    $(`#${data.roomid}`).attr("src","https://robohash.org/4.png?set=set4");
    moveToBottom();

}
$(window).on('load',function() {
    moveToBottom();
});

function moveToBottom() {
      // $("#chatmessages").scrollTop($("#chatmessages")[0].scrollHeight)
}