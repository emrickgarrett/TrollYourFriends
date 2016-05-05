/// send_clients_locations(socket_list)
socket_list = argument[0];

var buffer;

for(var i = 0; i < ds_list_size(socket_list); i++){

    buffer = buffer_create(256, buffer_grow, 1);
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u16, PLAYER_MOVE);
    
    buffer_write(buffer, buffer_u16, o_player1.up);
    buffer_write(buffer, buffer_u16, o_player1.down);
    buffer_write(buffer, buffer_u16, o_player1.left);
    buffer_write(buffer, buffer_u16, o_player1.right);
    buffer_write(buffer, buffer_u16, o_player1.restart);
    
    buffer_write(buffer, buffer_u16, o_player2.up);
    buffer_write(buffer, buffer_u16, o_player2.down);
    buffer_write(buffer, buffer_u16, o_player2.left);
    buffer_write(buffer, buffer_u16, o_player2.right);
    buffer_write(buffer, buffer_u16, o_player2.restart);
    
    buffer_write(buffer, buffer_u16, o_player3.up);
    buffer_write(buffer, buffer_u16, o_player3.down);
    buffer_write(buffer, buffer_u16, o_player3.left);
    buffer_write(buffer, buffer_u16, o_player3.right);
    buffer_write(buffer, buffer_u16, o_player3.restart);
    
    buffer_write(buffer, buffer_u16, o_player4.up);
    buffer_write(buffer, buffer_u16, o_player4.down);
    buffer_write(buffer, buffer_u16, o_player4.left);
    buffer_write(buffer, buffer_u16, o_player4.right);
    buffer_write(buffer, buffer_u16, o_player4.restart);
    
    network_send_packet(ds_list_find_value(socket_list, i), buffer, buffer_tell(buffer));
    
    buffer_delete(buffer);

}
