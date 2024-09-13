class LogSerializer < ActiveModel::Serializer
  attributes :id, :ip_address, :timestamp, :status_code
end
