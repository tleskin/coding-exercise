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
        (subscription.coffee_id == coffee.id)
      end
    end

    def get_active_subscribed(coffee)
      @store[:subscriptions].select do |subscription|
        (subscription.coffee_id == coffee.id) && (subscription.status == 'active')
      end
    end

    def toggle_subscription(customer, coffee)
      find_subscription(customer, coffee).toggle_subscription
    end

    def find_subscription(customer, coffee)
      @store[:subscriptions].detect do |subscription|
        (subscription.customer_id == customer.id) && (subscription.coffee_id == coffee.id)
      end
    end

    def cancel_subscription(customer, coffee)
      raise "You cannot cancel a paused subscription" if find_subscription(customer, coffee).status == 'paused'
      find_subscription(customer, coffee).cancel_subscription
    end

    def last_subscription_id(coffee)
      get_subscribed(coffee).last.id
    end

    def resubscribe(customer, coffee)
      add_subscription(BlueBottle::Models::Subscription.new(last_subscription_id(coffee) + 1, customer.id, coffee.id))
    end
  end
end
