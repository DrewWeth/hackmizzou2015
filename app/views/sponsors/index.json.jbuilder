json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :id, :name, :level, :user_id, :donation, :email, :phone, :rep, :image_url
  json.url sponsor_url(sponsor, format: :json)
end
