class SentencesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sentence, only: [:show]

  def index
    @sentences = Sentence.all
    @results = Result.where(user_id: current_user.id).all.index_by(&:sentence_id)
  end

  def show
    @result = Result.find_or_initialize_by(
      user_id: current_user.id, sentence_id: @sentence.id)
  end

  def prev
    @sentence = Sentence.where("id < ?", params[:sentence_id]).order("id DESC").first
    if @sentence.nil?
      redirect_to sentences_path
    else
      redirect_to sentence_path(@sentence)
    end
  end

  def next
    @sentence = Sentence.where("id > ?", params[:sentence_id]).order(:id).first
    if @sentence.nil?
      redirect_to sentences_path
    else
      redirect_to sentence_path(@sentence)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sentence
      @sentence = Sentence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sentence_params
      params.require(:sentence).permit(:sid, :body)
    end
end
