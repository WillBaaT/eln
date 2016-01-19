class Gene < ActiveRecord::Base
	has_many :pcrs,  dependent: :destroy
	validates_presence_of :name
	validates_format_of :name, :with => /[A-Z]/, :message => "Gene name must be UPPERCASE"
	accepts_nested_attributes_for :pcrs, :allow_destroy => true, :reject_if => :all_blank
end

