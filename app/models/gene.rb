class Gene < ActiveRecord::Base
	has_many :pcrs,  dependent: :destroy
	validates_presence_of :gene_name
	# validates_format_of :gene_name, :with => /[A-Z]/, :message => "Gene name must be UPPERCASE"
	accepts_nested_attributes_for :pcrs, :allow_destroy => true, :reject_if => :all_blank

	before_save :check_gene_name_upcase

  private
  
  def check_gene_name_upcase
    if self.gene_name_changed?
      self.gene_name = self.gene_name.upcase
    end
  end

end

