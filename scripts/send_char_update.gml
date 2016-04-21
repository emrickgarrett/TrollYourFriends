//send_char_update(inst, char);
var inst = argument[0];
var char = argument[1];

var socket_list = o_server.socket_list;

// Send data to each of the sockets.
var buffer = buffer_create(256, buffer_grow, 1);
buffer_seek(buffer, buffer_seek_start, 0);
buffer_write(buffer, buffer_u16, CHAR_SELECT);
buffer_write(buffer, buffer_u16, inst);
buffer_write(buffer, buffer_u16, char);

for(var i = 0; i < ds_list_size(socket_list); i++){
    network_send_packet(ds_list_find_value(socket_list, i), buffer, buffer_tell(buffer));
}

buffer_delete(buffer);
