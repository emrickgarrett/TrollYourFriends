/// send_client_id(Socket, id);

var socket = argument[0];
var _id = argument[1];

var buffer = buffer_create(256, buffer_grow, 1);
buffer_seek(buffer, buffer_seek_start, 0);
buffer_write(buffer, buffer_u16, PLAYER_ID);
buffer_write(buffer, buffer_u16, _id);

network_send_packet(socket, buffer, buffer_tell(buffer));

buffer_delete(buffer);
