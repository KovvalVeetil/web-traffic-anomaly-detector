require 'rails_helper'

RSpec.describe Log, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      log = Log.new(ip_address: '127.0.0.1', path: '/home', status_code: 200, timestamp: Time.now)
      expect(log).to be_valid
    end

    it 'is invalid without an IP address' do
      log = Log.new(path: '/home', status_code: 200, timestamp: Time.now)
      expect(log).not_to be_valid
      expect(log.errors[:ip_address]).to include("can't be blank")
    end

    it 'is invalid without a path' do
      log = Log.new(ip_address: '127.0.0.1', status_code: 200, timestamp: Time.now)
      expect(log).not_to be_valid
      expect(log.errors[:path]).to include("can't be blank")
    end

    it 'is invalid without a status code' do
      log = Log.new(ip_address: '127.0.0.1', path: '/home', timestamp: Time.now)
      expect(log).not_to be_valid
      expect(log.errors[:status_code]).to include("can't be blank")
    end

    it 'is invalid with a non-integer status code' do
      log = Log.new(ip_address: '127.0.0.1', path: '/home', status_code: 'abc', timestamp: Time.now)
      expect(log).not_to be_valid
      expect(log.errors[:status_code]).to include("is not a number")
    end

    it 'is invalid without a timestamp' do
      log = Log.new(ip_address: '127.0.0.1', path: '/home', status_code: 200)
      expect(log).not_to be_valid
      expect(log.errors[:timestamp]).to include("can't be blank")
    end

    it 'is invalid with a status code outside valid range' do
      log = Log.new(ip_address: '127.0.0.1', path: '/home', status_code: 700, timestamp: Time.now)
      expect(log).not_to be_valid
      expect(log.errors[:status_code]).to include("must be less than or equal to 599")
    end
  end
end
