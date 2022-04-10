# frozen_string_literal: true

module Budget::CategoriesHelper
  def budget_category_options_for_select
    Budget::Category.all.map { |k| [k.description, k.id] }
  end
end
