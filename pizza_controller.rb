require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('models/pizza_order')
also_reload('./models/*')
#https://medium.com/@shubhangirajagrawal/the-7-restful-routes-a8e84201f206

get('/pizza_orders') do
  #should be the PizzaOrder.all method
  #render some kind of view called index
  @orders= PizzaOrder.all()
  erb(:index)
end

get('/pizza_orders/new') do
  erb(:new)
end

#in general, putting matching routes with wildcards below
get('/pizza_orders/:id') do
  @order= PizzaOrder.find(params[:id])
  erb(:show)
end

post('/pizza_orders') do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

get('/pizza_orders/:id/edit') do
  @order= PizzaOrder.find(params[:id])
  #redirect to '/pizza_orders'
  erb(:edit)
end

post('/pizza_orders/:id') do
  @order= PizzaOrder.new(params)
  @order.update()
  erb(:update)
end

post('/pizza_orders/:id/delete') do
  @order= PizzaOrder.find(params[:id])
  PizzaOrder.delete_by_id(@order.id)
  #redirect to '/pizza_orders'
  erb(:destroy)
end
