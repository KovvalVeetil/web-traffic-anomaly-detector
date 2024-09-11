require 'csv'

LOG_FILE_PATH = '/var/log/apache2/web_server_test_access.log'

def parse_log_file(file_path)
  puts "Starting log parsing..."

  unless File.exist?(file_path)
    puts "Log file not found at #{file_path}"
    return
  end

  File.foreach(file_path) do |line|
    if line =~ /(\d+\.\d+\.\d+\.\d+) - - \[(.*?)\] "GET (.*?) HTTP\/\d+\.\d+" (\d+)/
      ip_address = $1
      timestamp = $2
      path = $3
      status_code = $4

      # Process the log entry
      puts "IP Address: #{ip_address}, Path: #{path}, Status Code: #{status_code}, Timestamp: #{timestamp}"
    else
      puts "No match for line: #{line}"
    end
  end
end

parse_log_file(LOG_FILE_PATH)
