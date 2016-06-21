require 'exonio'

module TaxEasy
  module Calculator
    class Installment

      def initialize(overrides = {})
        @calculator = overrides.fetch(:calculator) { Exonio }
      end

      def calculate(interest, financing_time_months, total)
        @calculator.pmt(interest/100, financing_time_months, -total)
      end
    end
  end
end
