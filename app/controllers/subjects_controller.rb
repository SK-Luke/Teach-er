class SubjectsController < ApplicationController
  before_action :select_subject, only: %i[show edit update destroy]

  def index
    @subjects = Subject.all
    @subject = Subject.new
  end

  def show
  end

  # def new
  #   @subject = Subject.new
  # end

  def create
    @subject = Subject.new(subject_params)
    @subject.user = current_user
    @subject.save
    redirect_to subjects_path(@subject)
  end

  def destroy
    @subject.destroy

    redirect_to subjects_path(@subject)
  end

  def edit
    @subjects = Subject.all
  end

  def update
    @subject.update(subject_params)

    redirect_to subjects_path(@subject)
  end

  private

  def select_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params[:subject][:grade].shift
    params.require(:subject).permit(:title, :description, :hourly_rate, grade: [])
  end
end
