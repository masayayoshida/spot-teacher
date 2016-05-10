class StaticPagesController < ApplicationController
  def home
    @school = School.all
  end

end
