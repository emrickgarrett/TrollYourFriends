/// ReceivedPacket(buffer, socket, inst)

//show_debug_message("Received");

var buffer = argument[0];
var socket = argument[1];
var inst = argument[2];
    
var msgid = buffer_read(buffer, buffer_u16);

switch(msgid){
    case TEST:
        var msg = buffer_read(buffer, buffer_string);
        show_debug_message(msg);
    break;   
    case MOUSE:
        
        var mous_x = buffer_read(buffer, buffer_u16);
        var mous_y = buffer_read(buffer, buffer_u16);
        
        switch(inst){
            case 0:
                o_cursor1.x = mous_x;
                o_cursor1.y = mous_y;
            break;
            case 1:
                //show_debug_message("Mouse X: " + string(mous_x) + " Mouse Y: " + string(mous_y));
                o_cursor2.x = mous_x;
                o_cursor2.y = mous_y;
            break;
            case 2:
                o_cursor3.x = mous_x;
                o_cursor3.y = mous_y;
            break;
            case 3:
                o_cursor4.x = mous_x;
                o_cursor4.y = mous_y;
            break;
        }    
        send_clients_cursors();
    break;
    case CHAR_SELECT:
        var select = buffer_read(buffer, buffer_u16);
        char_select(inst, select);
    break;
}
