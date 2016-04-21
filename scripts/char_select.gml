//char_select(inst, char)
var inst = argument[0];
var char = argument[1];

show_debug_message("Char Select... Inst: " + string(inst) + " char: " + string(char));

switch(inst){
    case 0:
        //check to make sure the others don't have this character selected
        if(o_server.p2_char != char and o_server.p3_char != char and o_server.p4_char != char){
            // Check to make sure that the current player doesn't have another selected
            if(o_server.p1_char == 0 or o_server.p1_char == char){
                if(o_server.p1_char == char){
                    o_server.p1_char = 0;
                    send_char_update(inst, char);
                }else{
                    o_server.p1_char = char;
                    send_char_update(inst, char);
                }
            }
        }
        
    break;
    case 1:
        //check to make sure the others don't have this character selected
        if(o_server.p1_char != char and o_server.p3_char != char and o_server.p4_char != char){
            // Check to make sure that the current player doesn't have another selected
            if(o_server.p2_char == 0 or o_server.p2_char == char){
                if(o_server.p2_char == char){
                    o_server.p2_char = 0;
                    send_char_update(inst, 0);
                }else{
                    o_server.p2_char = char;
                    send_char_update(inst, char);
                }
            }
        }
    break;
    case 2:
        //check to make sure the others don't have this character selected
        if(o_server.p2_char != char and o_server.p1_char != char and o_server.p4_char != char){
            // Check to make sure that the current player doesn't have another selected
            if(o_server.p3_char == 0 or o_server.p3_char == char){
                if(o_server.p3_char == char){
                    o_server.p3_char = 0;
                    send_char_update(inst, 0);
                }else{
                    o_server.p3_char = char;
                    send_char_update(inst, char);
                }
            }
        }
    break;
    
    case 3:
        //check to make sure the others don't have this character selected
        if(o_server.p2_char != char and o_server.p3_char != char and o_server.p1_char != char){
            // Check to make sure that the current player doesn't have another selected
            if(o_server.p4_char == 0 or o_server.p4_char == char){
                if(o_server.p4_char == char){
                    o_server.p4_char = 0;
                    send_char_update(inst, 0);
                }else{
                    o_server.p4_char = char;
                    send_char_update(inst, char);
                }
            }
        }
    break;
}
