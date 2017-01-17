class MemberDetailsController < ApplicationController
  before_action :set_member_detail, only: [:show, :edit, :update, :destroy]

  # GET /member_details
  # GET /member_details.json
  def index
    @member_details = MemberDetail.all
  end

  # GET /member_details/1
  # GET /member_details/1.json
  def show
  end

  # GET /member_details/new
  def new
    @member_detail = MemberDetail.new
  end

  # GET /member_details/1/edit
  def edit
  end

  # POST /member_details
  # POST /member_details.json
  def create
    @member_detail = MemberDetail.new(member_detail_params)

    respond_to do |format|
      if @member_detail.save
        @detail = MemberDetail.last
        flash[:success] = "添加成功"
        format.html { redirect_to @member_detail, notice: 'Member detail was successfully created.' }
        format.json { render :show, status: :created, location: @member_detail }
        format.js
      else
        format.html { render :new }
        format.json { render json: @member_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_details/1
  # PATCH/PUT /member_details/1.json
  def update
    respond_to do |format|
      if @member_detail.update(member_detail_params)
        format.html { redirect_to @member_detail, notice: 'Member detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @member_detail }
      else
        format.html { render :edit }
        format.json { render json: @member_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_details/1
  # DELETE /member_details/1.json
  def destroy
    @member_detail.destroy
    respond_to do |format|
      format.html { redirect_to member_details_url, notice: 'Member detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_detail
      @member_detail = MemberDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_detail_params
      params.require(:member_detail).permit(:member_id, :per_pay, :re_pay, :cumulative, :createtime, :operate_id)
    end
end
