class AnomalySerializer < ActiveModel::Serializer
  attributes :id, :ip_address, :anomaly_type, :detected_at, :details
