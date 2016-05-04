/// ReceivedPacket(buffer, socket, inst)

//show_debug_message("Received");

var buffer = argument[0];
var socket = argument[1];
var inst = argument[2];
    
var msgid = buffer_read(buffer, buffer_u16);

//Flags to determine specific actions:
var mouse_enabled = false;
if(room == r_character_select) mouse_enabled = true;


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
                if(mouse_enabled){
                    o_cursor1.x = mous_x;
                    o_cursor1.y = mous_y;
                }
            break;
            case 1:
                //show_debug_message("Mouse X: " + string(mous_x) + " Mouse Y: " + string(mous_y));
                if(mouse_enabled){
                    o_cursor2.x = mous_x;
                    o_cursor2.y = mous_y;
                }
            break;
            case 2:
                if(mouse_enabled){
                    o_cursor3.x = mous_x;
                    o_cursor3.y = mous_y;
                }
            break;
            case 3:
                if(mouse_enabled){
                    o_cursor4.x = mous_x;
                    o_cursor4.y = mous_y;
                }
            break;
        }
        if(mouse_enabled){    
            send_clients_cursors();
        }
    break;
    case CHAR_SELECT:
        var select = buffer_read(buffer, buffer_u16);
        char_select(inst, select);
    break;
    case PLAYER_MOVE:
        var up = buffer_read(buffer, buffer_u16);
        var left = buffer_read(buffer, buffer_u16);
        var right = buffer_read(buffer, buffer_u16);
        var down = buffer_read(buffer, buffer_u16);
        
        var char = -1;
        if(room == r_test){
            switch(inst){
                case 0:
                    char = p1_char;
                break;
                case 1:
                    char = p2_char;
                break;
                case 2:
                    char = p3_char;
                break;
                case 3:
                    char = p4_char;
                break;
            }
            
            switch(char){
                case YELLOW:
                    char = o_player1;
                break;
                case BLUE:
                    char = o_player2;
                break;
                case PINK:
                    char = o_player3;
                break;
                case GREEN:
                    char = o_player4;
                break;
            }
            
            char.up = up;
            char.down = down;
            char.left = left;
            char.right = right;
        }
    break;
}
