//send_clients_room_transition(room)
var _room = argument[0];
var socket_list = o_server.socket_list;

var buffer;

//Decide which room to navigate to

switch(_room){
    case r_character_select:
        _room = ROOM_CHARACTER_SELECT;
    break;
    case r_test:
        _room = ROOM_TEST;
    break;
    case r_menu:
        _room = ROOM_MENU;
    break;
}

for(var i = 0; i < ds_list_size(socket_list); i++){
    
    buffer = buffer_create(256, buffer_grow, 1);
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u16, ROOM_TRANSITION);
    buffer_write(buffer, buffer_u16, _room);
    
    network_send_packet(ds_list_find_value(socket_list, i), buffer, buffer_tell(buffer));
    
    buffer_delete(buffer);

}
