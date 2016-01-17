class ClonesController < ApplicationController
	def index
		@gene = Gene.all
		@pcr = Pcr.all
	end
end
