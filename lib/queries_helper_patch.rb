module QueriesHelperPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      unloadable # Send unloadable so it will not be unloaded in development

      alias_method_chain :column_header, :nilable_criteria
    end
  end

  module InstanceMethods
    def column_header_with_nilable_criteria(column)
      column.sortable and !@sort_critera.nil? ? sort_header_tag(column.name.to_s, :caption => column.caption,
                                                        :default_order => column.default_order) :
                      content_tag('th', h(column.caption))
    end
  end
end
