class CoursesController <ApplicationController
  #before_action :authenticate

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
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.save(course_params)
      redirect_to courses_path
    else
      render :edit
    end
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
