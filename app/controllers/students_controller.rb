class StudentsController < ApplicationController
  before_action :authenticate_user!, only: :index
  expose(:student, attributes: :student_params)
  expose(:student_subject_items) { student.subject_item}
  expose(:students)

  def create
    if student.save
      redirect_to student_path(student), notice: I18n.t('shared.created', resource: 'Student')
    else
      render :new
    end
  end

  def update
    if student.save
      redirect_to student_path(student), notice: I18n.t('shared.updated', resource: 'Student')
    else
      render :edit
    end
  end

  def destroy
    student.destroy
    redirect_to students_path, notice: I18n.t('shared.deleted', resource: 'Student')
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, subject_item_ids: [], participation_ids: [])
  end
end
