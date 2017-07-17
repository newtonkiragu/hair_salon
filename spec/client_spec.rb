describe(Client) do
  describe("#==")do
    it"is the same client if it has the same phonenumber" do
      client1 = Client.new({:name => "susan", :phonenumber => 703273429, :stylist_id => 1})
      client2 = Client.new({:name => "susan", :phonenumber => 703273429, :stylist_id => 1})
      expect(client1).to(eq(client2))
    end
  end

  describe(".all")do
    it"is empty at first" do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it"adds a client to the array of saved clients" do
      test_client = Client.new({:name => "susan", :phonenumber => 703273429, :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe("#name") do
    it("lets you read the name out") do
      test_client = Client.new({:name => "susan", :phonenumber => 703273429, :stylist_id => 1})
      expect(test_client.name()).to(eq("susan"))
    end
  end

  describe("#stylist_id") do
    it("lets you read the stylist ID out") do
      test_client = Client.new({:name => "susan", :phonenumber => 703273429, :stylist_id => 1})
      expect(test_client.stylist_id()).to(eq(1))
    end
  end

  describe("#phonenumber") do
    it"lets you read the phonenumber out" do
      test_client = Client.new({:name => "susan", :phonenumber => 703273429, :stylist_id => 1})
      expect(test_client.phonenumber()).to(eq(703273429))
    end
  end
end
