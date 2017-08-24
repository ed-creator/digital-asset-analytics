class PriceHistory < ApplicationRecord
  belongs_to :digital_asset

  def date_timestamp
    Time.at(date_integer_timestamp).to_datetime
  end

end
