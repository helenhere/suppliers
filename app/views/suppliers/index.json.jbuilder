json.array!(@suppliers) do |supplier|
  json.extract! supplier, :id, :first_name, :last_name, :product_name, :phone, :company
  json.url supplier_url(supplier, format: :json)
end
