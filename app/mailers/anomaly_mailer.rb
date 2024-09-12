class AnomalyMailer < ApplicationMailer
    default from: 'notifications@example.com'
  
    def anomaly_alert(anomaly)
      @anomaly = anomaly
      mail(to: 'admin@example.com', subject: 'Anomaly Detected')
    end
  end
  