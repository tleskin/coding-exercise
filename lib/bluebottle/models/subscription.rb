module BlueBottle
  module Models
    class Subscription
      attr_accessor :id,
                    :customer_id,
                    :coffee_id,
                    :status

      def initialize(id, customer_id, coffee_id)
        @id = id
        @customer_id = customer_id
        @coffee_id = coffee_id
        @status = 'active'
      end

      def active?
        @status == 'active'
      end

      def paused?
        @status == 'paused'
      end

      def toggle_subscription
        if @status == 'active'
          @status = 'paused'
        else
          @status = 'active'
        end
      end

      def cancel_subscription
        @status = 'cancelled'
      end
    end
  end
end
