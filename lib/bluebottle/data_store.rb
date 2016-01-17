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

    def subscriptions
      @store[:subscriptions]
    end

    def add_subscription(subscription)
      @store[:subscriptions] << subscription
    end

    def get_active_subscriptions(customer)
      @store[:subscriptions].select do |subscription|
        subscription.customer_id == customer.id && subscription.active?
      end
    end

    def get_paused_subscriptions(customer)
      @store[:subscriptions].select do |subscription|
        subscription.customer_id == customer.id && subscription.paused?
      end
    end

    def get_subscribed(coffee)
      @store[:subscriptions].select do |subscription|
        subscription.coffee_id == coffee.id
      end
    end

    def toggle_subscription(customer, coffee)
      subscription = @store[:subscriptions].detect do |subscription|
        (subscription.customer_id == customer.id) && (subscription.coffee_id == coffee.id)
      end.toggle_subscription
    end
  end
end
