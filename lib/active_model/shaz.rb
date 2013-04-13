require "active_model/shaz/version"
require "active_model/state_tracking"

module ActiveModel
  module Shaz
    def save_it
      self.save
      self
    end
    alias_method :saved, :save_it

    def update_it *args
      self.update *args
      self
    end
    alias_method :updated_with, :update_it

    def destroy_it
      self.destroy
      self
    end
    alias_method :destroyed, :destroy_it

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


