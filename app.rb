require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

# class Product < ActiveRecord::Base
#     belongs_to :order
# end

# class Order < ActiveRecord::Base
#     has_many :products
#     belongs_to :client
# end

# class Client < ActiveRecord::Base
#     has_many :orders
#     has_many :products, :through => :orders
# end

class Product < ActiveRecord::Base
#     belongs_to :order
end

class Order < ActiveRecord::Base

end

configure do
  enable :sessions
end

helpers do
  def username
    session[:identity] ? session[:identity] : 'Hello stranger'
  end
end

before do
  @prod_all_list = Product.order "created_at"
end

before '/secure/*' do
  unless session[:identity]
    session[:previous_url] = request.path
    @error = 'Sorry, you need to be logged in to visit ' + request.path
    halt erb(:login_form)
  end
end

get '/' do
  erb :index
end

get '/about' do
  erb :about

end

get '/login/form' do
  erb :login_form
end

post '/login/attempt' do
  if params['username'] == 'admin' && params['passwd'] == 'mypass'
    session[:identity] = params['username']
    where_user_came_from = session[:previous_url] || '/'
    redirect to where_user_came_from
  else
    @error = 'Wrong login/password pair'
    halt erb(:login_form)
  end
end

get '/logout' do
  session.delete(:identity)
  erb "<div class='alert alert-message'>Logged out</div>"
end

get '/secure/place' do
  @all_orders = Order.order "created_at"
  # erb 'This is a secret place that only <%=session[:identity]%> has access to!'
  erb :secret_area
end


post '/cart' do
  @ord_hash = {}
  @ord_inpt = params[:orders]
  params[:orders].split(',').each do |kvpair| 
    # item = kvpair.split('=')
    # @ord_hash[item[0].delete('pzshp_product_')] = item[1]
      @ord_hash[kvpair.split('=')[0].delete('pzshp_product_')] = kvpair.split('=')[1]
  end
  erb :cart
end


get '/cart' do
  redirect to '/'
end

get '/order' do
  redirect to '/'
end

post '/order' do
  @o_new = Order.new params[:order]
  if @o_new.save
    erb :complete
  else
    @error = "Error somewhere: " + @o_new.errors.full_messages.first
    erb :index
  end
end