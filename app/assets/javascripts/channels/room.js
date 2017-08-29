App.room = App.cable.subscriptions.create("RoomChannel", {
    connected: function(){
        // Called when the subscription is ready for use on the server
        this.perform('print_log', { msg: 'send from client' });
    },
    disconnected: function() {
        // Called when the subscription has been terminated by the server
    },
    received: function(data) {
        // Called when there's incoming data on the websocket for this channel
        var msg = '客户端收到消息：' + data['roomid'] + '  ' +data['userid']+'  '+ data['message'] + '\n';
        //简单地打印接收到的信息
        console.log(msg);
        updatechatview(data);

    }
});