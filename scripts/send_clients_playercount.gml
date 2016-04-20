//send_clients_playercount(Socket_list)

var socket_list = argument[0];

for(var i = 0; i < ds_list_size(socket_list); i++){
    sock = ds_list_find_value(socket_list, i);
    
    //Send playercount
    var buffer = buffer_create(256, buffer_grow, 1);
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u16, PLAYER_COUNT);
    buffer_write(buffer, buffer_u16, ds_list_size(socket_list));
    
    network_send_packet(sock, buffer, buffer_tell(buffer));
    
    buffer_delete(buffer);
}

