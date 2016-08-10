require 'pry'

class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      req_item = @@items.find {|item| item.name == req.path.split("/").last}
      if req_item
        resp.write "#{req_item.price}"
        #resp.status = 200
      else
        resp.write "Item not found"
        resp.status = 400
      end

      #binding.pry
      # @@items.each do |item|
      #   if item.name == req.path.split("/").last
      #     #binding.pry
      #     resp.write "#{item.price}"
      #     resp.status = 200
      #   else
      #     binding.pry
      #     resp.write "Item not found"
      #     resp.status = 400
      #   end
      # end

    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end


end
