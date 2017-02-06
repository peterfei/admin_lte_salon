class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy,:charge,:rebill]
  before_action :load_workbook, only: [:export]
  # GET /members
  # GET /members.json
  def index
    @q = Member.ransack(params[:q])
    @members = @q.result(distinct: true).page(params[:page])
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

  def export
    @wb.add_worksheet(name: "Basic") do |sheet|
      sheet.add_row get_header
      Member.all.each do |st|
        sheet.add_row [st.name, st.cid, st.blance, st.phone, st.remark]


      end
      # sheet.add_chart(Axlsx::Pie3DChart, :start_at => [6,3], :end_at => [20,20], :title => "Marks of #{@name} in Pie Chart") do |chart|
      #   chart.add_series :data => sheet["C2:C6"], :labels => sheet["A2:A6"],  :colors => ['FF0000', '00FF00', '0000FF', '999900', '990033']
      # end

    end
    @p.serialize("#{Rails.root}/tmp/basic.xlsx")
    send_file("#{Rails.root}/tmp/basic.xlsx", filename: "Basic.xlsx", type: "application/xlsx")
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

    def load_workbook
      @p = Axlsx::Package.new
      @wb = @p.workbook
      load_styles

    end

    def load_styles
      @wb.styles do |s|
        @heading = s.add_style alignment: {horizontal: :center}, b: true, sz: 18, bg_color: "0066CC", fg_color: "FF"
        @header = s.add_style alignment: {horizontal: :center}, b: true, sz: 10, bg_color: "C0C0C0"
        @data = s.add_style alignment: {wrap_text: true}
        @center = s.add_style alignment: {horizontal: :center}, fg_color: "0000FF"
        @green = s.add_style alignment: {horizontal: :left}, fg_color: "00FF00"
        @red = s.add_style alignment: {horizontal: :left}, fg_color: "FF0000"
        @style_pass = [@data, @data, @data, @data, @center, @green]
        @style_fail = [@data, @data, @data, @data, @center, @red]
        @total = [@data, @header, @header, @header, @header, @header]
        @date_format = s.add_style :format_code => 'YYYY-MM-DD'
        @time_format = s.add_style :format_code => 'hh:mm:ss'
      end
    end

    def get_header
      ["姓名", "卡号", "余额","电话", "备注"]
    end
end
