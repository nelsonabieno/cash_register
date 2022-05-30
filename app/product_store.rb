class ProductStore
  # retrieves products registered from a json file
  def self.get_products(file_name)
    file = File.read(file_name)
    JSON.parse(file)
  end
end