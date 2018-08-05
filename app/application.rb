class Application

    @@items = [Item.new("Macbook", 1200), Item.new("Bose", 350)]

    resp = Rack::Response.new
    req = Rack::Request.new
    def call(env)
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
end
