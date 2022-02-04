class PredicatesController < ApplicationController
  def create
    @predicate = Predicate.new predicate_params

    @predicate.save
    redirect_back(fallback_location: root_path)
  end

  private

  def predicate_params
    params.require(:predicate).permit(:name)
  end
end
