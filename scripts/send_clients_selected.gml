// send_clients_selected(socket_list);
var socket = argument[0];
var inst = argument[1];

//need to send client any picking that have already happened, each one has to be it's own packet
// Having bugs... maybe have it send all 4 packets at once in a separate method?
// Oh shit, I get it now.... I have to stop it from updating the server version..

var buffer;
var char;

for(var i = 0; i < inst+1; i++){

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


