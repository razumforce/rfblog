class HomeController < ApplicationController
  def show
  	session[:times_her] = 0
  	session[:a] = 5
  	session[:times_visited] = if session[:times_visited].nil?
  			1
  		else
  			session[:times_visited] + 1
  		end
  end
end
