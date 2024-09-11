# lib/tasks/log_ingestion.rake
namespace :logs do
    desc "Ingest logs from a file"
    task ingest: :environment do
      file_path = ENV['LOG_FILE_PATH'] || 'path_to_log_file.log'
      
      File.foreach(file_path) do |line|
        begin
          # Example log format: "127.0.0.1 /home 200 2024-09-11T12:34:56Z"
          ip, path, status, timestamp = line.split
          log = Log.create!(
            ip_address: ip,
            path: path,
            status_code: status.to_i,
            timestamp: Time.parse(timestamp)
          )
          puts "Ingested log: #{log.inspect}"
        rescue => e
          puts "Failed to ingest log line: #{line}. Error: #{e.message}"
        end
      end
  
      puts "Log ingestion complete!"
    end
  end
  