json.array!(@orders) do |order|
  json.extract! order, :id, :datetime_of_purchase
  json.url order_url(order, format: :json)
end
