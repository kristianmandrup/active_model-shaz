module ActiveModel::StateTracking
  extend ActiveSupport::Concern

  included do
    after_create do
      @created = true
    end

    after_update do
      @created = false
    end

    after_destroy do
      @destroyed = true
    end
  end

  def created?
    @created == true
  end

  def destroyed?
    @destroyed == true
  end
end
