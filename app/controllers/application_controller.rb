class ApplicationController < ActionController::Base
  # Ref: https://stackoverflow.com/a/4983354/6739302
  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end
end
