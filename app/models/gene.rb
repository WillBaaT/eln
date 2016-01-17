class Gene < ActiveRecord::Base
	has_many :pcrs,  dependent: :destroy
	validates :number, :uniqueness => true
	validates :name, :presence => true
	accepts_nested_attributes_for :pcrs, :allow_destroy => true, :reject_if => :all_blank
end

