/// send_clients_cursors();

var t_buffer = buffer_create(256, buffer_grow, 1);
buffer_seek(t_buffer, buffer_seek_start, 0);
buffer_write(t_buffer, buffer_u16, MOUSE);
// Add data for each mouse starting at o_cursor1 through o_cursor4. This is constant
buffer_write(t_buffer, buffer_s16, o_cursor1.x);
buffer_write(t_buffer, buffer_s16, o_cursor1.y);

buffer_write(t_buffer, buffer_s16, o_cursor2.x);
buffer_write(t_buffer, buffer_s16, o_cursor2.y);

buffer_write(t_buffer, buffer_s16, o_cursor3.x);
buffer_write(t_buffer, buffer_s16, o_cursor3.y);

buffer_write(t_buffer, buffer_s16, o_cursor4.x);
buffer_write(t_buffer, buffer_s16, o_cursor4.y);

for(var i = 0; i < ds_list_size(socket_list); i++;){
    //show_debug_message("Sending Packet to Client: Right Click");
    network_send_packet(ds_list_find_value(socket_list, i), t_buffer, buffer_tell(t_buffer));
}
buffer_delete(t_buffer);
