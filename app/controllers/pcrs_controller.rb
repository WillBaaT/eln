class PcrsController < ApplicationController

  def index
  	@gene = Gene.all
  	@pcr = Pcr.all
  	if Gene.first.nil?
  		redirect_to new_pcr_path
  	end
  end

  def new
    @pcr = Pcr.new
  end
  def genenewpcr
    @pcr = Pcr.new
    @pcr.gene = Gene.find(params[:id])
  end
  def create
    @pcr = Pcr.create(pcr_params)
    if  Gene.find_by_gene_name(@pcr.gene.gene_name)
      @pcr.gene = Gene.find(Gene.find_by_gene_name(@pcr.gene.gene_name).id)
      end
    if @pcr.save
      
      redirect_to pcrs_path
    else
      render new_pcr_path
    end
  end
  def reload
    render new_pcr_path
  end
  def show
  	@pcr = Pcr.find(params[:id])
  end
  def geneshow
    @gene = Gene.find(params[:id])
  end
  def edit
    @pcr = Pcr.find(params[:id])
  end
  def geneedit
    @gene = Gene.find(params[:id])
  end
  def update
    @pcr = Pcr.find(params[:id])
    @pcr.update(pcr_params)
    redirect_to pcr_path(@pcr)
  end
  def geneupdate
    @gene = Gene.find(params[:id])
    @gene.update(gene_params)
    redirect_to :action => :geneshow, :id => @gene
  end
  def destroy
    @pcr = Pcr.find(params[:id])
    @pcr.destroy
    if @pcr.gene.pcrs.empty?
      @pcr.gene.destroy
    end
    redirect_to pcrs_path
  end
def reload
    render new_pcr_path
  end
  private
  def pcr_params
      params.require(:pcr).permit(
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
      :gene_attributes => [
      :id,
      :species,
      :number,
      :gene_name,
      :size,
      :_destroy]
  )
  end
  def gene_params
    params.require(:gene).permit(
      :id,
      :species,
      :number,
      :gene_name,
      :size)
  end
end