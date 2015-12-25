# 软删除
module Mongoid
  module SoftDelete
    extend ActiveSupport::Concern

    included do
      field :deleted_at, type: DateTime

      default_scope -> { where(deleted_at: nil) }

      alias_method :destroy!, :destroy
    end

    def destroy
      run_callbacks(:destroy) do
        if persisted?
          self.deleted_at=Time.now
        end
        save
        @destroyed = true
      end
      freeze
    end

    def deleted?
      deleted_at.present?
    end
  end
end
