# Set up for the application and database. DO NOT CHANGE. ###################
require "sinatra"                                                           #
require "sinatra/reloader" if development?                                  #
require "sequel"                                                            #
require "logger"                                                            #
require "twilio-ruby"                                                       #
DB ||= Sequel.connect "sqlite://#{Dir.pwd}/development.sqlite3"             #
DB.loggers << Logger.new($stdout) unless DB.loggers.size > 0                #
def view(template); erb template.to_sym; end                                #
use Rack::Session::Cookie, key: 'rack.session', path: '/', secret: 'secret' #
before { puts; puts "--------------- NEW REQUEST ---------------"; puts }   #
after { puts }                                                              #
#############################################################################

items_table = DB.from(:items)
customer_input_table = DB.from(:customer_input)

get "/" do

    view "home"
end



get "/items" do
    puts "params: #{params}"

    puts items_table.all
    @items = items_table.all
    view "items"
end

get "/items/:id" do
    puts "params: #{params}"

    pp items_table.where(id: params[:id]).to_a[0]
    @item = items_table.where(id: params[:id]).to_a[0]
    view "item"
end

get "/items/:id/customer_input/new" do
    puts "params: #{params}"

    
    view "new_customer_input"
end


