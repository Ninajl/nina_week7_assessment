class CoursesController <ApplicationController
  before_action :authenticate

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    else
      rendor :new
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.destroy
      redirect_to courses_path
    end
  end

  private
  def course_params
    params.require(:course).permit(:title, :day, :night)
  end
end
