class LogParser
    def initialize(file_path)
      @file_path = file_path
    end
  
    def parse
      File.foreach(@file_path) do |line|
        puts "Processing log entry: #{line}"
      end
    end
  end
  
  # Example usage
  if __FILE__ == $PROGRAM_NAME
    parser = LogParser.new('/var/log/apache2/web_server_test_access.log')
    parser.parse
  end
  