class ApplicationController < ActionController::Base
  layout :layout_by_resource

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def layout_by_resource
    if devise_controller?
      "v1/devise_layout"
    else
      "application"
    end
  end
end
