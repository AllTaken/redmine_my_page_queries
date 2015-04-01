module SortHelperPatch
	def self.included(base) # :nodoc:
		base.send(:include, InstanceMethods)

		base.class_eval do
			unloadable # Send unloadable so it will not be unloaded in development

			alias_method_chain :sort_css_classes, :nilable_criteria
		end
	end

	module InstanceMethods
		def sort_css_classes_with_nilable_criteria
			sort_css_classes_without_nilable_criteria unless @sort_criteria.nil?
		end
	end
end
