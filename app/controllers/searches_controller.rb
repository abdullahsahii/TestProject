# class SearchesController < ApplicationController
#   def search
#     selected_category = params[:category]
#     if selected_category == "Name"
#       @query = params[:q]
#       @characters = Character.where('name LIKE ?', "%#{@query}%")
#     elsif selected_category == "Gender"
#       @query = params[:q]
#       @characters = Character.where('gender LIKE ?', "%#{@query}%")
#     elsif selected_category == "Skills"
#       @query = params[:q]
#       @users = User.tagged_with(@query, on: :skills)
#     elsif selected_category == "Experience"
#       @query = params[:q]
#       @users = User.tagged_with(@query, on: :experiences)
#     elsif selected_category = "Skills&Experience"
#       @query = params[:q]
#       @users = User.tagged_with(@query, on: :skills) & User.tagged_with(@query, on: :experiences)
#     end
#     render layout: false
#   end
# end