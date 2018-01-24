# encoding: utf-8

module FrontendReloadControl
  module Rails
    module Inject
      def self.included(base)
        base.send :include, FrontendReloadControl::Rails::Helpers
        if ::Rails.version.split('.')[0].to_i >= 5
          base.before_action :add_frontend_reload_control_timestamp
        else
          base.before_filter :add_frontend_reload_control_timestamp
        end
      end
    end
  end
end