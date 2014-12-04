class StaticPagesController < ApplicationController
  def home
    @teams = Team.all
     @country_count = Team.distinct.count('country_code')
  end

  def about
  end

  def tutorials
  end

  def faq
  end

  def balloon
  end

  def thanks_register
  end
end
