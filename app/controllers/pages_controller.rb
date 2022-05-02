class PagesController < ApplicationController
  def contact
  end

  def about
    @title = "My Awesome About Us Page"
  end

  def home
    @projects = Project.all
  end

end
