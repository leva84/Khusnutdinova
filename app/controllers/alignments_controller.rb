class AlignmentsController < ApplicationController
  before_action :set_alignment, only: [:show, :edit, :update, :destroy]

  # GET /alignments
  def index
    @alignments = Alignment.all
  end

  # GET /alignments/1
  def show

  end

  # GET /alignments/new
  def new
    @alignment = Alignment.new
  end

  # GET /alignments/1/edit
  def edit

  end

  # POST /alignments
  def create
    @alignment = Alignment.create(alignment_params)

    if @alignment.save
      redirect_to @alignment
    else
      render 'new'
    end
  end

  # PATCH/PUT /alignments/1
  def update
    if @alignment.update(alignment_params)
      redirect_to @alignment
    else
      render 'edit'
    end
  end

  # DELETE /alignments/1
  def destroy
    @alignment.destroy

    redirect_to alignments_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alignment
      @alignment = Alignment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def alignment_params
      params.require(:alignment).permit(:title, :rule, :quantity, :deck_name)
    end
end
