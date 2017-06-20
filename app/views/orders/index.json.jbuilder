json.array!(@orders) do |order|
  json.extract! order, :id, :date_of_purchase, :time_of_purchase
  json.url order_url(order, format: :json)
end
