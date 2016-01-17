module BlueBottle
  class DataStore
    def initialize
      @store = {
        customers: [],
        coffees: [],
        subscriptions: []
      }
    end

    def customers
       @store[:customers]
    end

    def add_coffee(coffee)
      @store[:coffees] << coffee
    end

    def add_customer(customer)
      @store[:customers] << customer
    end

    def get_active_subscriptions(customer)
      @store[:subscriptions].select do |subscription|
        subscription.customer_id == customer.id && subscription.active?
      end
    end

    def subscriptions
      @store[:subscriptions]
    end

    def add_subscription(subscription)
      @store[:subscriptions] << subscription
    end
  end
end
