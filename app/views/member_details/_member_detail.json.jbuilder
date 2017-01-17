json.extract! member_detail, :id, :member_id, :per_pay, :re_pay, :cumulative, :createtime, :operate_id, :created_at, :updated_at
json.url member_detail_url(member_detail, format: :json)