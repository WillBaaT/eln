class Pcr < ActiveRecord::Base
	belongs_to :gene
	validates_presence_of :fragment_name
	# validates_numericality_of :product_size, :only_integer => true
	accepts_nested_attributes_for :gene, :allow_destroy => true, :reject_if => proc { |a| 
     a['gene_name'].blank? }

     before_save :converse_k_to_1000
private
  
  def converse_k_to_1000
    if  /k/ =~ self.product_size
      self.product_size = self.product_size.sub("k","000")
    end
  end
end

