if defined?(WillPaginate)
  ActiveSupport.on_load :active_record do
    module WillPaginate
      module ActiveRecord
        module RelationMethods
          alias_method :per, :per_page
          alias_method :num_pages, :total_pages
          alias_method :total_count, :count
        end
      end
    end
  end
end