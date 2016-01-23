class GenesController < ApplicationController
  def index
    @gene = Gene.all
    @pcr = Pcr.all
    if Gene.first.nil?
      redirect_to new_gene_path
    end
  end
  def new
    @gene = Gene.new
    @gene.pcrs.build
  end
  def create
    @gene = Gene.new(gene_params)
    # if  Gene.find_by_gene_name(@gene.gene_name)
    #   @gene.pcrs.gene_id = Gene.find(Gene.find_by_gene_name(@gene.gene_name).id)
    #   end
    if @gene.save
      redirect_to genes_path
    else
      render new_gene_path
    end
  end
  def show
    @gene = Gene.find(params[:id])
  end
  def edit
    @gene = Gene.find(params[:id])
  end
  def update
    @gene = Gene.find(params[:id])
    @gene.update(gene_params)
    redirect_to gene_path(@gene)
  end
  

  private
  def gene_params
    params.require(:gene).permit(
      :id,
      :species,
      :number,
      :gene_name,
      :size,
      :sequence,
      :pcrs_attributes => [
      :id,
      :gene_id,
      :fragment_name, 
      :product_size,
      :final_vector,
      :machine,
      :enzyme,
      :break,
      :break_t,
      :denature,
      :denature_t,
      :annealing,
      :annealing_t,
      :elongation,
      :elongation_t,
      :polya,
      :polya_t,
      :cycles,
      :_destroy])
  end
end