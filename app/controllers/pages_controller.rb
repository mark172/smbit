class PagesController < ApplicationController
  def index
  end

  def admin
    if current_user
      redirect_to contacts_path
    end
  end
end
