class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sentence

  def create
    result = Result.find_or_initialize_by(
      user_id: current_user.id, sentence_id: @sentence.id)
    result.update(result_params)
    redirect_to sentence_next_path(@sentence)
  end

  def update
    create
  end

  private
    def set_sentence
      @sentence = Sentence.find(params[:sentence_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:body)
    end
end
