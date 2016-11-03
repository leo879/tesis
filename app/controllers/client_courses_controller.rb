class ClientCoursesController < ApplicationController
  before_action :set_client_course, only: [:show, :edit, :update, :destroy]

  # GET /client_courses
  # GET /client_courses.json
  def index
    @client_courses = ClientCourse.all
  end

  # GET /client_courses/1
  # GET /client_courses/1.json
  def show
  end

  # GET /client_courses/new
  def new
    @client_course = ClientCourse.new
  end

  # GET /client_courses/1/edit
  def edit
  end

  # POST /client_courses
  # POST /client_courses.json
  def create
    @client_course = ClientCourse.new(client_course_params)

    respond_to do |format|
      if @client_course.save
        format.html { redirect_to @client_course, notice: 'Client course was successfully created.' }
        format.json { render :show, status: :created, location: @client_course }
      else
        format.html { render :new }
        format.json { render json: @client_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_courses/1
  # PATCH/PUT /client_courses/1.json
  def update
    respond_to do |format|
      if @client_course.update(client_course_params)
        format.html { redirect_to @client_course, notice: 'Client course was successfully updated.' }
        format.json { render :show, status: :ok, location: @client_course }
      else
        format.html { render :edit }
        format.json { render json: @client_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_courses/1
  # DELETE /client_courses/1.json
  def destroy
    @client_course.destroy
    respond_to do |format|
      format.html { redirect_to client_courses_url, notice: 'Client course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_course
      @client_course = ClientCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_course_params
      params.require(:client_course).permit(:client_id, :course_id)
    end
end
