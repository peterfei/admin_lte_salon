require 'test_helper'

class MemberDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member_detail = member_details(:one)
  end

  test "should get index" do
    get member_details_url
    assert_response :success
  end

  test "should get new" do
    get new_member_detail_url
    assert_response :success
  end

  test "should create member_detail" do
    assert_difference('MemberDetail.count') do
      post member_details_url, params: { member_detail: { createtime: @member_detail.createtime, cumulative: @member_detail.cumulative, member_id: @member_detail.member_id, operate_id: @member_detail.operate_id, per_pay: @member_detail.per_pay, re_pay: @member_detail.re_pay } }
    end

    assert_redirected_to member_detail_url(MemberDetail.last)
  end

  test "should show member_detail" do
    get member_detail_url(@member_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_member_detail_url(@member_detail)
    assert_response :success
  end

  test "should update member_detail" do
    patch member_detail_url(@member_detail), params: { member_detail: { createtime: @member_detail.createtime, cumulative: @member_detail.cumulative, member_id: @member_detail.member_id, operate_id: @member_detail.operate_id, per_pay: @member_detail.per_pay, re_pay: @member_detail.re_pay } }
    assert_redirected_to member_detail_url(@member_detail)
  end

  test "should destroy member_detail" do
    assert_difference('MemberDetail.count', -1) do
      delete member_detail_url(@member_detail)
    end

    assert_redirected_to member_details_url
  end
end
