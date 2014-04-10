module MyControllerPatch
  def self.included(base)
    base.class_eval do
      helper :sort
      include SortHelper
      helper :queries
      include QueriesHelper
    end
  end
end

