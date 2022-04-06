class DnaSequencesController < ApplicationController
  before_action :set_dna_sequence, only: %i[ show update destroy ]

  # GET /dna_sequences
  def index
    @dna_sequences = DnaSequence.all

    render json: @dna_sequences
  end

  # GET /dna_sequences/1
  def show
    render json: @dna_sequence
  end

  # POST /dna_sequences
  def create
    @dna_sequence = DnaSequence.new(dna_sequence_params)

    if @dna_sequence.save
      render json: @dna_sequence, status: :created, location: @dna_sequence
    else
      render json: @dna_sequence.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dna_sequences/1
  def update
    if @dna_sequence.update(dna_sequence_params)
      render json: @dna_sequence
    else
      render json: @dna_sequence.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dna_sequences/1
  def destroy
    @dna_sequence.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dna_sequence
      @dna_sequence = DnaSequence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dna_sequence_params
      params.require(:dna_sequence).permit(:dna, :category)
    end
end
