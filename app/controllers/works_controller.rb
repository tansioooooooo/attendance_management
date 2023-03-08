class WorksController < ApplicationController
  before_action :set_work, only: %i[ show edit update destroy ]

  # GET /works or /works.json
  def index
    @works = Work.all
  end

  # GET /works/1 or /works/1.json
  def show
  end

  # GET /works/new
  def new
    @work = Work.new
  end

  # GET /works/1/edit
  def edit
  end

  # POST /works or /works.json
  def create
    @work = Work.new(work_params)
    @work.user = current_user
    respond_to do |format|
      if @work.save
        format.html { redirect_to edit_work_url(@work), notice: "勤怠を登録しました。" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /works/1 or /works/1.json
  def update
    respond_to do |format|
      if @work.update(work_params)
        format.html { redirect_to edit_work_url(@work), notice: "勤怠を更新しました。" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1 or /works/1.json
  def destroy
    @work.destroy

    respond_to do |format|
      format.html { redirect_to works_url, notice: "勤怠を削除しました。" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_params
      params.require(:work).permit(:user_id, :date, :start_time, :end_time)
    end
end
