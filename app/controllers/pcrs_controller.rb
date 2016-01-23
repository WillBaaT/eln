class PcrsController < ApplicationController







  def new
    @gene = Gene.find(params[:gene_id])
    @pcr = @gene.pcrs
  end
  def create
    @gene = Gene.find(params[:gene_id])
    @pcr = @gene.pcrs.create(pcr_params)
    # if @pcr.save
      redirect_to genes_path
    # else
    #   render new_gene_pcr_path(@gene)
    # end
  end
  def show
  	@gene = Gene.find(params[:gene_id])
    @pcr = Pcr.find(params[:id])
  end
  def edit
    @gene = Gene.find(params[:gene_id])
    @pcr = Pcr.find(params[:id])
  end
  def update
    @pcr = Pcr.find(params[:id])
    @pcr.update(pcr_params)
    redirect_to gene_pcr_path(@pcr.gene, @pcr)
  end
  def destroy
    @gene = Gene.find(params[:gene_id])
    @pcr = @gene.pcrs.find(params[:id])
    @pcr.destroy
    if @gene.pcrs.empty?
      @gene.destroy
    end
    redirect_to genes_path
  end
  
def reload
    render new_pcr_path
  end
  private
  def pcr_params
      params.require(:pcr).permit(
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
      :cycles
  )
  end
end