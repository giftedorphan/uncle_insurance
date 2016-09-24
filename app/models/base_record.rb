class BaseRecord < ApplicationRecord
  before_save :upcase_fields

   self.abstract_class = true

  private
    def upcase_fields
      self.attributes.each { |k, v|
        if v.is_a? String
          self[k] = v.upcase
        end
      }
    end
end