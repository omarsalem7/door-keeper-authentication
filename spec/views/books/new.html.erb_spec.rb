require 'rails_helper'

RSpec.describe 'books/new', type: :view do
  before(:each) do
    assign(:book, Book.new(
                    title: 'MyString',
                    body: 'MyText'
                  ))
  end

  it 'renders new book form' do
    render

    assert_select 'form[action=?][method=?]', books_path, 'post' do
      assert_select 'input[name=?]', 'book[title]'

      assert_select 'textarea[name=?]', 'book[body]'
    end
  end
end
