class Pcr < ActiveRecord::Base
	belongs_to :gene
	validates_presence_of :fragment_name, :gene
	validates_numericality_of :product_size, :only_integer => true
	accepts_nested_attributes_for :gene, :allow_destroy => true, :reject_if => :all_blank


	before_save :check_fragment_name_serial_upcase
  

  private
  
  def check_fragment_name_serial_upcase
    if self.fragment_name_changed?
      self.fragment_name = self.fragment_name.upcase
    end
  end


end

