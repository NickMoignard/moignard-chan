class ApplicationRecord < ActiveRecord::Base
  require 'set'
  self.abstract_class = true
end
