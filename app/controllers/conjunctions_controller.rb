class ConjunctionsController < ApplicationController
  def create
    @conjunction = Conjunction.new conjunction_params

    @conjunction.save
    redirect_back(fallback_location: root_path)
  end

  private

  def conjunction_params
    params.require(:conjunction).permit(:name)
  end
end
