namespace :logs do
    desc "Parse Apache access logs"
    task parse: :environment do
      require 'log_parser'
      parser = LogParser.new('/var/log/apache2/web_server_test_access.log')
      parser.parse
    end
  end
  