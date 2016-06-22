require "pp"

class WelcomeController < ApplicationController
  protect_from_forgery except: [ :form_submit ]  # form タグべた書きのためトークンが付かない

  def index
    @object_3 = FormObject.new
  end

  # POST welcome/form_submit  (../../config/routes.rb)
  def form_submit
    puts "params => #{params}"

    if params.has_key?(:form_object)
      object = FormObject.new(params.require(:form_object))
      pp object
    end

    redirect_to root_path
  end
end
