module QueriesHelperPatch
	def self.included(base) # :nodoc:
		base.send(:include, InstanceMethods)

		base.class_eval do
			unloadable

			alias_method_chain :column_header, :nilable_criteria
		end
	end

	module InstanceMethods
		def column_header_with_nilable_criteria(column)
			if sort_criteria.nil?
				content_tag('th', h(column.caption))        
			else
				column_header_without_nilable_criteria(column)
			end
		end
	end
end
