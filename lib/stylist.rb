class Stylist
  attr_reader(:name, :id, :phonenumber, :idnumber)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @phonenumber = attributes.fetch(:phonenumber)
    @idnumber = attributes.fetch(:idnumber)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i()
      idnumber = stylist.fetch("idnumber").to_i()
      phonenumber = stylist.fetch("phonenumber").to_i()
      stylists.push(Stylist.new({:name => name, :id => id, :idnumber => idnumber, :phonenumber => phonenumber}))
    end
    stylists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name, idnumber, phonenumber) VALUES ('#{@name}', '#{idnumber}', '#{phonenumber}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    @phonenumber = attributes.fetch(:phonenumber)
    @id = self.id()
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
    DB.exec("UPDATE stylists SET phonenumber = '#{@phonenumber}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
    DB.exec("DELETE FROM clients WHERE stylist_id = #{self.id()};")
  end

  define_method(:==) do |another_stylist|
    self.name().==(another_stylist.name()).&(self.id().==(another_stylist.id())).&(self.idnumber().==(another_stylist.idnumber())).&(self.phonenumber().==(another_stylist.phonenumber()))
  end

  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.id().==(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  define_method(:clients) do
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    clients.each() do |client|
      name = client.fetch("name")
      phonenumber = client.fetch("phonenumber").to_i()
      stylist_id = client.fetch("stylist_id").to_i()
      stylist_clients.push(Client.new({:name => name, :stylist_id => stylist_id, :phonenumber => phonenumber, :idnumber => idnumber}))
    end
    stylist_clients
  end
end
