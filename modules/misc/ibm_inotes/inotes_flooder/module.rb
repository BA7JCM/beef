#
# Copyright (c) 2006-2025Wade Alcorn wade@bindshell.net
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
class Inotes_flooder < BeEF::Core::Command
  def self.options
    [
      { 'type' => 'label', 'name' => 'name', 'html' => 'Send a note to someone with an attachment:' },
      { 'type' => 'textfield', 'name' => 'to', 'ui_label' => 'TO', 'value' => '' },
      { 'type' => 'textfield', 'name' => 'subject', 'ui_label' => 'Subject', 'value' => '' },
      { 'name' => 'body', 'ui_label' => 'Body', 'type' => 'textarea', 'value' => '' },
      { 'type' => 'textfield', 'name' => 'delay', 'ui_label' => 'Delay (ms)', 'value' => '100' }
    ]
  end

  def post_execute
    save({ 'result' => @datastore['result'] })
  end
end
