class WeightsController < ApplicationController

  def create
    Users.each { |user|
      if user.current_weight.present?
        Weight.new(weight: user[:current_weight], date: Date.yesterday, user_id: user.id]
      end
    }
  end

end

