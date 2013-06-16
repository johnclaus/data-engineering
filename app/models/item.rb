class Item < ActiveRecord::Base
  belongs_to :merchant
  validates :merchant_id, presence: true

  composed_of :price,
              :class_name => "Money",
              :mapping => [%w(price_cents cents), %w(currency_type currency_as_string)],
              :constructor => Proc.new { |cents, currency_type | 
                Money.new(cents || 0, currency_type|| Money.default_currency) },
              :converter => Proc.new { |value| 
                value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, 
                "Unable to convert #{value.class} into Money") }
  
  validates :description, uniqueness: true, presence: true
end