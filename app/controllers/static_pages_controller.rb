class StaticPagesController < ApplicationController
  def home
    @teams = Team.all
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
