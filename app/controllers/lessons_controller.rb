class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]


  def show
  end

  private


def require_authorized_for_current_lesson
  if current_user.enrolled_in?(current_lesson.section.course)
  else
    redirect_to courses_path, alert: 'You need to be enrolled to view lessons'
  end
end


# This is calling in the search and storing it for if a user lines up with the creation of the lesson.
  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end


