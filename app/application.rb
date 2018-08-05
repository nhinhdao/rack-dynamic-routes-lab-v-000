class application

    @@items = [Item.new("Macbook", 1200), Item.new("Bose", 350)]

    resp = Rack::Respond.new
    req = Rack::Require.new

    if req.path.match(/items/)
        item_name = req.path.split("items").last
        if item = @@items.find {|i| i.name = item_name}
            resp.write "#{item.price}"
        else
            resp.write "Item not found"
            resp.status = 400
        end
    else
        resp.write "Route not found"
        resp.status = 404
    end
    resp.finish
end
