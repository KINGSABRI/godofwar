#
# KING SABRI | @KINGSABRI
#

module GodOfWar
  #
  # All war internal operations
  #
  class Payloads

    Payload = Struct.new(:name, :desc, :os, :conf, :url, :ref, :path)

    # @!attribute [r] [String] payloads_home
    #   full path of the payloads home
    # @!attribute [r] [Hash] payloads_db
    #   parsed content of 'payloads_info.json' which full information about available payloads
    # @!attribute [r] [Array] payloads
    #   array of available payloads
    # @!attribute [r] [Hash] info
    #   of information of the current payload
    attr_reader :payloads_home, :payloads_db, :payloads, :info
    # @!attribute [rw] payload [String]
    #   the current payload name
    attr_accessor :payload

    def initialize
      @payloads_home =
          File.absolute_path(
              File.join('..', '..', '..', 'payloads'), __FILE__
          )
      @payloads_db   =
          JSON.parse(
              File.read(
                  File.absolute_path(
                      File.join(@payloads_home, 'payloads_info.json')
                  )
              )
          )
    end

    # payloads_parse lists all payloads as [Payload] objects
    #
    # @return [Array<Payload>]
    def payloads_parse
      @payloads_db.map do |payload, info|
        name = payload
        desc = info["desc"]
        os   = info["os"]
        conf = info["conf"]
        url  = info["url"]
        ref  = info["ref"]
        path = File.absolute_path(File.join(@payloads_home, payload))
        Payload.new(name, desc, os, conf, url, ref, path)
      end
    end

    # Finds the payload from @payloads_db
    #
    # @param [String] payload
    #   payload name
    #
    # @return [Payload] object
    def find_payload(payload)
      payloads_parse.find{|pay| pay.name == payload}
    end

    #
    # list_tree List all available payloads using folder name conversion
    #
    # @return [Array]
    #
    def list_tree
      payloads_parse.map do |payload|
        if payload.conf["true"]
          payload.conf = payload.conf.values.first
        else
          payload.conf["false"] = 'No Settings required!'
        end

        "├── " + "#{payload.name}\n".bold   +
            "│   └── Information:\n"        +
            "│       ├── Description: #{payload.desc}\n" +
            "│       ├── OS:          #{payload.os}\n"   +
            "│       ├── Settings:    #{payload.conf}\n" +
            "│       ├── Usage:       #{payload.url}\n"  +
            "│       ├── References:  #{payload.ref}\n"  +
            "│       └── Local Path:  #{payload.path}"
      end
    end
  end
end

if __FILE__ == $0
  require 'pp'
  require_relative 'extensions'
  include GodOfWar::Extensions::Core::String

  # pp GodOfWar::Payloads::HOME
  payloads = GodOfWar::Payloads.new
  # pp payloads.payloads.map(&:name)
  pp payload = payloads.payloads_db.find{|payload| payload.name == 'reverse_shell_ui'}#.first
  pp payload.name
  # puts payloads.list_payloads_tree
end

