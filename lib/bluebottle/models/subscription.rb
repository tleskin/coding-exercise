module BlueBottle
  module Models
    class Subscription
      attr_accessor :id,
                    :customer_id,
                    :coffee_id,
                    :active

      def initialize(id, customer_id, coffee_id)
        @id = id
        @customer_id = customer_id
        @coffee_id = coffee_id
        @active = true
      end

      def active?
        @active
      end

      def paused?
        @active == false
      end

      def toggle_subscription
        @active = !@active
      end
    end
  end
end
