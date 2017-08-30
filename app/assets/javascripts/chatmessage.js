function updatechatview(data)
{

    // roomid: @chatroomid,
    // roomname:@chatroom.roomname,
    // private_chat:@chatroom.private_chat,
    // username: current_user.username,
    // userid: current_user.id,
    // message: @message,
    // created_at:Time.zone.now.to_s

    if(data['private_chat'])
    {
        privatechat(data);
        $("#chatmessages").append("<h5>" + data['created_at'] + "  " + data['username'] + " say " + "<br></h5><span><h4>" + data['message'] + "<h4></span>");
        moveToBottom();
    }
    else if(data['roomid']==($("#room_id").val())&&data['userid']!=($("#user_id").val()))
    {
        $("#chatmessages").append("<h5>" + data['created_at'] + "  " + data['username'] + " say " + "<br></h5><span><h4>" + data['message'] + "<h4></span>");
        moveToBottom();
        publicchat(data);
    }



    // location.reload();
}


$(window).on('load',function() {
     moveToBottom();
});

function moveToBottom() {
       // $("#chatmessages").scrollTop($("#chatmessages")[0].scrollHeight);
}

function publicchat(data)
{

    if(data['roomid']!=($("#room_id").val()))
        $(`#${data.roomid}`).attr("src","https://robohash.org/4.png?set=set4");
}

function privatechat(data)
{
    console.log("私人聊天哦");
    // var users=data['roomname'].split("/");
    var to_user=data['userid']
    console.log("消息来自："+to_user);
    $(`#${data.userid}`).attr("src","https://robohash.org/4.png?set=set4");

}