# class Admin::BaseController < ApplicationController
# end
# module Admin
#     class BaseController < ApplicationController
#       before_action :authenticate_admin!
#       http_basic_authenticate_with name: "admin", password: "password"
  
#       private
  
#       def authenticate_admin!
#         # Implement basic admin authentication
#         unless current_user&.admin?
#           redirect_to root_path, alert: "Access denied!"
#         end
#       end
#     end
#   end
module Admin
    class BaseController < ApplicationController
      before_action :authenticate_user! # Ensure the user is logged in
      before_action :authenticate_admin!
  
      private
  
      def authenticate_admin!
        unless current_user&.admin?
          redirect_to root_path, alert: "Access denied!"
        end
      end
    end
  end
  