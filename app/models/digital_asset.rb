class DigitalAsset < ApplicationRecord
  validates :ticker, uniqueness: true
end
