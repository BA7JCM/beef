#
# Copyright (c) 2006-2025 Wade Alcorn - wade@bindshell.net
# Browser Exploitation Framework (BeEF) - https://beefproject.com
# See the file 'doc/COPYING' for copying permission
#

module BeEF
  module Core
    module Models
      # @note Table stores the commands that have been sent to the Hooked Browsers.
      class Command < BeEF::Core::Model
        has_many :results
        has_one :command_module
        has_one :hooked_browser

        #
        # Save results and flag that the command has been run on the hooked browser
        #
        # @param [String] hook_session_id The session_id.
        # @param [String] command_id The command_id.
        # @param [String] command_friendly_name The command friendly name.
        # @param [String] result The result of the command module.
        #
        def self.save_result(hook_session_id, command_id, command_friendly_name, result, status)
          # @note argument type checking
          raise TypeError, '"hook_session_id" needs to be a string' unless hook_session_id.is_a?(String)
          raise TypeError, '"command_id" needs to be an integer' unless command_id.is_a?(Integer)
          raise TypeError, '"command_friendly_name" needs to be a string' unless command_friendly_name.is_a?(String)
          raise TypeError, '"result" needs to be a hash' unless result.is_a?(Hash)
          raise TypeError, '"status" needs to be an integer' unless status.is_a?(Integer)

          # @note get the hooked browser structure and id from the database
          hooked_browser = BeEF::Core::Models::HookedBrowser.where(session: hook_session_id).first || nil
          raise TypeError, 'hooked_browser is nil' if hooked_browser.nil?
          raise TypeError, 'hooked_browser.id is nil' if hooked_browser.id.nil?

          # @note get the command module data structure from the database
          command = where(id: command_id, hooked_browser_id: hooked_browser.id).first || nil
          raise TypeError, 'command is nil' if command.nil?

          # @note create the entry for the results
          BeEF::Core::Models::Result.create(
            hooked_browser_id: hooked_browser.id,
            command_id: command.id,
            data: result.to_json,
            status: status,
            date: Time.now.to_i
          )

          s = show_status(status)
          log = "Hooked browser [id:#{hooked_browser.id}, ip:#{hooked_browser.ip}]"
          log += " has executed instructions (status: #{s}) from command module [cid:#{command_id},"
          log += " mod: #{command.command_module_id}, name:'#{command_friendly_name}']"
          BeEF::Core::Logger.instance.register('Command', log, hooked_browser.id)
          print_info log

          true
        end

        # @note show status
        def self.show_status(status)
          case status
          when -1
            'ERROR'
          when 1
            'SUCCESS'
          else
            'UNKNOWN'
          end
        end
      end
    end
  end
end
