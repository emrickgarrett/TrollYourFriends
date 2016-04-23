// send_clients_selected(socket_list);
var socket_list = argument[0];

//need to send client any picking that have already happened, each one has to be it's own packet

var buffer;
var char;

for(var i = 0; i < ds_list_size(socket_list); i++){
    
    socket = ds_list_find_value(socket_list, i);

    buffer = buffer_create(256, buffer_grow, 1);
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u16, CHAR_SELECT);
    buffer_write(buffer, buffer_u16, i);
    
    char = 0;
    
    switch(i){
        case 0:
            char = o_server.p1_char;
        break;
        case 1:
            char = o_server.p2_char;
        break;
        case 2:
            char = o_server.p3_char;
        break;
        case 3:
            char = o_server.p4_char;
        break;
    }
    
    buffer_write(buffer, buffer_u16, char);
    
    network_send_packet(socket, buffer, buffer_tell(buffer));
    
    buffer_delete(buffer);

}


