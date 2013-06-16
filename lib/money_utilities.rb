class MoneyUtilities
  attr_accessor :revenue
  attr_reader :purchases

  def initialize(purchases)
    @purchases = purchases
  end

  def calculate_revenue
    @revenue = purchases.inject(Money.new(0)) {|revenue, purchase|
      revenue += purchase.price;
      revenue
    }
  end

  def display_revenue
    if revenue.nil?
      calculate_revenue
    end

    sprintf("$%.2f", revenue.dollars)
  end
end
