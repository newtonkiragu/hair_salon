require('rspec')
require('pg')
require('pry')
require('spec_helper')
require('stylist')

DB = PG.connect({:dbname => 'hair_salon'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylists *;")
  end
end

describe(Stylist) do
  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you the stylists name") do
      stylist = Stylist.new({:name => "Epicodus stuff", :id => nil, :phonenumber =>739403690, :idnumber => 35431824})
      expect(stylist.name()).to(eq("Epicodus stuff"))
    end
  end

  describe("#phonenumber") do
    it("tells you the stylists phonenumber") do
      stylist = Stylist.new({:name => "Epicodus stuff", :id => nil, :phonenumber =>739403690, :idnumber => 35431824})
      expect(stylist.phonenumber()).to(eq(739403690))
    end
  end

  describe("#idnumber") do
    it("tells you the stylists idnumber") do
      stylist = Stylist.new({:name => "Epicodus stuff", :id => nil, :phonenumber =>739403690, :idnumber => 35431824})
      expect(stylist.idnumber()).to(eq(35431824))
    end
  end



  describe("#id") do
    it("sets its ID when you save it") do
      stylist = Stylist.new({:name => "Epicodus stuff", :id => nil, :phonenumber =>739403690, :idnumber => 35431824})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save stylists to the database") do
      stylist = Stylist.new({:name => "Epicodus stuff", :id => nil, :phonenumber =>739403690, :idnumber => 35431824})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#update")do
    it"lets you update stylists in the database" do
      stylist = Stylist.new({:name => "Epicodus stuff", :id => nil, :phonenumber =>739403690, :idnumber => 35431824})
      stylist.save()
      stylist.update({:name => "Homework stuff"})
      expect(stylist.name()).to(eq("Homework stuff"))
    end
  end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist = Stylist.new({:name => "Epicodus stuff", :id => nil, :phonenumber =>739403690, :idnumber => 35431824})
      stylist.save()
      stylist2 = Stylist.new({:name => "Epicodus stuff", :id => nil, :phonenumber =>739403690, :idnumber => 35431824})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end

    it("deletes stylist's clients from the database") do
      stylist = Stylist.new({:name => "Epicodus stuff", :id => nil, :phonenumber =>739403690, :idnumber => 35431824})
      stylist.save()
      client = Client.new({:name => name, :phonenumber => phonenumber, :stylist_id => stylist_id})
      client.save()
      client2 = Client.new({:name => name, :phonenumber => phonenumber, :stylist_id => stylist_id})
      client2.save()
      stylist.delete()
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same name") do
      stylist1 = Stylist.new({:name => "Epicodus stuff", :id => nil, :phonenumber =>739403690, :idnumber => 35431824})
      stylist2 = Stylist.new({:name => "Epicodus stuff", :id => nil, :phonenumber =>739403690, :idnumber => 35431824})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe(".find") do
    it("returns a stylist by its ID") do
      test_stylist = Stylist.new({:name => "Epicodus stuff", :id => nil, :phonenumber =>739403690, :idnumber => 35431824})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Epicodus stuff", :id => nil, :phonenumber =>739403690, :idnumber => 35431824})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#clients") do
    it("returns an array of clients for that stylist") do
      test_stylist = Stylist.new({:name => "Epicodus stuff", :id => nil, :phonenumber =>739403690, :idnumber => 35431824})
      test_stylist.save()
      test_client = Client.new({:name => name, :phonenumber => phonenumber, :stylist_id => test_stylist_id})
      test_client.save()
      test_client2 = Client.new({:name => name, :phonenumber => phonenumber, :stylist_id => test_stylist_id})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end
end
