class AnomalyDetector
    def initialize(logs)
      @logs = logs
    end
  
    def detect_anomalies
      @logs.each do |log|
        detect_high_traffic(log)
        detect_suspicious_requests(log)
      end
    end
  
    private
  
    def detect_high_traffic(log)
      # Consider high traffic if more than 100 requests in 10 minutes
      timeframe = 10.minutes.ago
      request_count = Log.where(ip_address: log.ip_address)
                         .where('timestamp > ?', timeframe)
                         .count
  
      if request_count > 100
        anomaly = Anomaly.create!(
          ip_address: log.ip_address,
          anomaly_type: 'High Traffic',
          detected_at: Time.current,
          details: "More than 100 requests in the last 10 minutes."
        )
  
        # Send alert email
        AnomalyMailer.anomaly_alert(anomaly).deliver_now
      end
    end
  
    def detect_suspicious_requests(log)
      if log.status_code == '404'
        # Track 404s from the same IP over a short period
        timeframe = 5.minutes.ago
        error_count = Log.where(ip_address: log.ip_address, status_code: '404')
                         .where('timestamp > ?', timeframe)
                         .count
  
        if error_count > 10
          anomaly = Anomaly.create!(
            ip_address: log.ip_address,
            anomaly_type: 'Suspicious Requests',
            detected_at: Time.current,
            details: "More than 10 404 errors in the last 5 minutes."
          )
  
          # Send alert email
          AnomalyMailer.anomaly_alert(anomaly).deliver_now
        end
      end
    end
  end
  