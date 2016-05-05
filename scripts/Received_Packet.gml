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
        var restart = buffer_read(buffer, buffer_u16);
        
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
                    
                    o_player1.up = up;
                    o_player1.down = down;
                    o_player1.left = left;
                    o_player1.right = right;
                    
                    if(restart){
                        o_player1.x = o_player1.start_x;
                        o_player1.y = o_player1.start_y;
                    }
                break;
                case BLUE:
                    char = o_player2;
                    
                    o_player2.up = up;
                    o_player2.down = down;
                    o_player2.left = left;
                    o_player2.right = right;
                    
                    if(restart){
                        o_player2.x = o_player2.start_x;
                        o_player2.y = o_player2.start_y;
                    }
                break;
                case PINK:
                    char = o_player3;
                    
                    o_player3.up = up;
                    o_player3.down = down;
                    o_player3.left = left;
                    o_player3.right = right;
                    
                    if(restart){
                        o_player3.x = o_player3.start_x;
                        o_player3.y = o_player3.start_y;
                    }
                break;
                case GREEN:
                    char = o_player4;
                    
                    o_player4.up = up;
                    o_player4.down = down;
                    o_player4.left = left;
                    o_player4.right = right;
                    
                    if(restart){
                        o_player4.x = o_player4.start_x;
                        o_player4.y = o_player4.start_y;
                    }
                break;
            }
            
            
            /*
            char.up = up;
            char.down = down;
            char.left = left;
            char.right = right;
            
            if(restart){
                char.x = char.start_x;
                char.y = char.start_y;
            }
            */
        }
    break;
}
