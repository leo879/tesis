module MembershipsHelper

  def llll()
    client = Client.new

    client.nombre='aaa'
    client.save!

  end

end
