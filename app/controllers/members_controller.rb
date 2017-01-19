class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy,:charge,:rebill]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all.page(params[:page])
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
    respond_to do |format|
      format.js
    end
  end

  # GET /members/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    @result = @member.save
    @members = Member.all.page(params[:page])
    respond_to do |format|
      if @result
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
        format.js
      else
        format.html { redirect_to :back }
        format.js

        # format.html { render :new }
        # format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    @result = @member.update(member_params)
    @members = Member.all.page(params[:page])
    respond_to do |format|
      if @result
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #会员消费
  def charge
    if params[:page].present?
      @page = params[:page]
    end
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.js
    end
  end

  #会员充值
  def rebill
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.js
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :cid, :sex, :level, :blance, :phone, :remark)
    end
end
