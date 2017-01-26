class BaseRecord < ApplicationRecord
  before_save :upcase_fields

   self.abstract_class = true

   def self.search_dni(dni)
    dni = dni.gsub(/[^0-9A-Za-z]/,'').upcase
    if dni.blank?
      all
    else
      where('clients.dni LIKE ?', "%#{dni}%")
    end
  end

  private
    def upcase_fields
      self.attributes.each { |k, v|
        if (v.is_a? String) && (k != 'link')
          self[k] = v.upcase
        end
      }
    end
end