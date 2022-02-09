class SubjectsController < ApplicationController
  def create
    @subject = Subject.new subject_params

    @subject.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @subject = Subject.find_by id: params[:id]

    @subject.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end
end
