class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
    
        if req.path.match(/items/)
            item_name = req.path.split("/items/").last
            if Item.all.find { |item| item.name == item_name }
                item_find = Item.all.find { |item| item.name == item_name }
                resp.write "#{item_find.price}"
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