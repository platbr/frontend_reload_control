# encoding: utf-8

module FrontendReloadControl
  module Rails
    module Helpers
      def add_frontend_reload_control_timestamp
        response.headers['X-Frontend-Reload-Control-Timestamp'] = ::Rails.cache.fetch("X-Frontend-Reload-Control-Timestamp")
      end
    end
  end
end