# encoding: utf-8

module FrontendReloadControl
  class Engine < ::Rails::Engine
    engine_name 'FrontendReloadControl'
    initializer 'FrontendReloadControl.load' do
      timestamp = File.open('timestamp.txt').read.strip rescue nil
      timestamp ||= Time.now.to_i.to_s
      ::Rails.cache.write("X-Frontend-Reload-Control-Timestamp", timestamp)
      ActiveSupport.on_load :action_controller do
        include FrontendReloadControl::Rails::Inject
      end
    end
  end
end