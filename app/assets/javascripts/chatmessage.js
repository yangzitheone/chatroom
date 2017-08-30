function updatechatview(data)
{

    if(data['roomid'] == ($("#room_id").val()) && data['userid'] != ($("#user_id").val()))
    {
        $("#chatmessages").append("<h5>"
                                    + data['created_at']
                                    + "  "
                                    + data['username']
                                    + " say "
                                    + "<br></h5><span><h4>"
                                    + data['message']
                                    + "<h4></span>"
                                 );


    }

    changestatus(data);

    // location.reload();
}


$(window).on('load',function() {
     moveToBottom();
});

    function moveToBottom()
{
       // $("#chatmessages").scrollTop($("#chatmessages")[0].scrollHeight);
}


    function changestatus(data)
{
    console.log("进入到changstatus")
    // if(data['roomid']!= ($("#room_id").val()))
    $(`#${data.roomid}`).attr("src","https://robohash.org/4.png?set=set4");
}