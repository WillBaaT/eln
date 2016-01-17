class Pcr < ActiveRecord::Base
	belongs_to :gene
	validates_presence_of :fragment_name
	validates_numericality_of :product_size, :only_integer => true

	accepts_nested_attributes_for :gene, :allow_destroy => true, :reject_if => :all_blank
	
end
