class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    before_action :populate_tags

    protected
    def populate_tags
        @topics = Topic.all
    end


end
