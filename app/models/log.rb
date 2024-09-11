class Log < ApplicationRecord
    validates :ip_address, presence: true
    validates :path, presence: true
    validates :status_code, presence: true
    validates :timestamp, presence: true

    validates :ip_address, format: { with: /\A(\d{1,3}\.){3}\d{1,3}\z/, message: "must be a valid IPv4 address" }
    validates :status_code, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 599 }
  end
  