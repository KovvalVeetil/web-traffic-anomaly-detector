class AnomalyDetectionJob < ApplicationJob
  queue_as :default

  def perform(*args)
    logs = Log.where('timestamp > ?', 10.minutes.ago)
    detector = AnomalyDetector.new(logs)
    detector.detect_anomalies
  end
end
