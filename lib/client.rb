class Client
  attr_reader(:name, :phonenumber, :stylist_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @phonenumber = attributes.fetch(:phonenumber)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      phonenumber = client.fetch("phonenumber").to_i()
      name = client.fetch("name")
      stylist_id = client.fetch("stylist_id").to_i()# the information comes from the database as a string
      clients.push(Client.new({:name => name, :phonenumber => phonenumber, :stylist_id => stylist_id}))

    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (name, phonenumber, stylist_id) VALUES ('#{@name}', '#{@phonenumber}', #{@stylist_id});")

  end

  define_method(:==) do |another_client|
    self.phonenumber().==(another_client.phonenumber()).&(self.stylist_id().==(another_client.stylist_id())).&(self.name().==(another_client.name()))
  end

end
