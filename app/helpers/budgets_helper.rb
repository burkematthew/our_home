# frozen_string_literal: true

module BudgetsHelper
  def budget_month_options_for_select
    Budget::BUDGET_MONTHS.map { |k| [k.to_s.titleize, k] }
  end
end
