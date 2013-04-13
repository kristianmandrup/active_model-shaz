require "active_model/shaz/version"
require "active_model/state_tracking"

module ActiveModel
  module Shaz
    def save_it
      self.save
      self
    end

    def destroy_it
      self.destroy
      self
    end

    def self.configure_for clazz
      [:state_tracking, :shaz].each do |name|
        clazz.send :include, "ActiveModel::#{name.to_s.camelize}".constantize
      end
    end
  end
end


if defined? Mongoid
  ActiveMode::Shaz.configure_for Mongoid::Document
end

if defined?(ActiveRecord) && defined?(ActiveRecord::Base) 
  ActiveMode::Shaz.configure_for ActiveRecord::Base
end


