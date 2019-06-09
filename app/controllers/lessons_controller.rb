class LessonsController < ApplicationController
  before_action :authenticate_user!
  # before_action :require_authorized_for_current_lesson, only: [:show]


  def show
  end

  private


def require_authorized_for_current_lesson
  if current_lesson.section.course.user != current_user
    render plain: "Unauthorized", status: :unauthorized 
  end
end


# This is calling in the search and storing it for if a user lines up with the creation of the lesson.
  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end


