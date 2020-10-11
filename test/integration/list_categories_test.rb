require 'test_helper'

def setup
  @category = Category.create(name: "Sports")
  @category2 = Category.create(name: "Movies")
end

class ListCategoriesTest < ActionDispatch::IntegrationTest
  test "List all categories with path to each category" do
    get '/categories'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
end
#uho