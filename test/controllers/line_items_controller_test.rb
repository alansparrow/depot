require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post :create, product_id: products(:ruby).id
    end

    assert_redirected_to store_path
  end

  test "should create line_item via ajax" do
    assert_difference('LineItem.count') do
      xhr :post, :create, product_id: products(:ruby).id
    end

    assert_response :success
    assert_select_jquery :html, '#cart' do
      assert_select 'tr#current_item td', /Programming Ruby 1.9/
    end
  end

  test "should show line_item" do
    get :show, id: @line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_item
    assert_response :success
  end

  test "should update line_item" do
    patch :update, id: @line_item, line_item: { product_id: @line_item.product_id }
    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should reduce line_item" do
    @line_item.quantity += 1
    assert_difference('@line_item.quantity', -1) do
      delete :destroy, id: @line_item.id
     
      # Holy shit! We really need this line T.T
      @line_item.reload
    end

    #@line_item.quantity += 1
    #before = @line_item.quantity
    #delete :destroy, id: @line_item.id
    # Holy shit! We really need this line T.T
    #@line_item.reload
    #after = @line_item.quantity
    #assert_equal after, before - 1
    

    assert_redirected_to store_url
  end

  test "should destroy line_item" do
    cart = Cart.create
    product = Product.all.first
    
    # This shit makes the test run
    session[:cart_id] = cart.id

    cart.add_product(product.id).save
    line_item = cart.line_items.find_by_product_id(product.id)

    assert_difference('cart.line_items.count', -1) do
      delete :destroy, id: line_item.id
      # Because cart.line_items.count query in Database 
      # so we don't need to reload it, different from @line_item.quantity
      #      cart.reload 
    end
  end

end
