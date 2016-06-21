require 'tax_easy/calculator/installment'

module TaxEasy
  module Financial
    module Brazil
      class IOF
        DEFAULT_IOF_DAY = 0.000041
        DEFAULT_IOF_ADDITIONAL = 0.0038

        def initialize(overrides = {})
          @iof_day = overrides.fetch(:iof_day) { DEFAULT_IOF_DAY }
          @iof_additional = overrides.fetch(:iof_additional) { DEFAULT_IOF_ADDITIONAL }
          @installment_calculator = overrides.fetch(:installment_calculator) { TaxEasy::Calculator::Installment.new }
        end

        # Calculates IOF for Loan in Brazil
        # @param loan_value [Float]
        # @param financing_time_months [Integer] The number of payments to be made
        # @param interest_rate [Float] The interest rate as decimal (not per cent) per period
        # @param loan_date [Date] The loan request date
        # @return [Float]
        #
        # @example
        #   TaxEasy::Financial::Brazil::IOF.new.calculate(20_000, 48, 1.5) # ==> 356.70671942746617
        #
        def calculate(loan_value, financing_time_months, interest_rate, loan_date = Date.today)
          balance = loan_value
          installment = installment_value(interest_rate, financing_time_months, loan_value)
          installment_date = loan_date.next_month
          iof = 0

          financing_time_months.step(1, -1) do |_|
            amortization = installment - interest_part(balance, interest_rate)

            days = past_days(loan_date, installment_date)

            iof += amortization*(@iof_day*(minimal_days(days)))
            iof += amortization*@iof_additional

            balance -= amortization
            installment_date = installment_date.next_month
          end

          loan_iof(iof, loan_value)
        end

        private

        ## Calcualtes installment value for loan
        def installment_value(interest_rate, financing_time_months, loan_value)
          @installment_calculator.calculate(interest_rate, financing_time_months, loan_value)
        end

        ## Calculates the final IOF base on IOF not loan value
        def loan_iof(iof, loan_value)
          (iof*loan_value)/(loan_value-iof)
        end

        ## Interest part to be payed on specific installment
        def interest_part(balance, interest_rate)
          balance*(interest_rate/100)
        end

        ## Past days from specific date
        def past_days(start_date, end_date)
          (end_date - start_date).to_i
        end

        ## Minimal days from 365 to calculate IOF
        def minimal_days(past_days)
          [past_days, 365].min
        end
      end
    end
  end
end
