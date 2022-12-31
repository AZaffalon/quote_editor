require 'application_system_test_case'

class QuotesTest < ApplicationSystemTestCase
  setup do
    login_as users(:accountant)
    @quote = Quote.ordered.first
  end

  test 'Creating a new quote' do
    visit quotes_path
    assert_selector 'h1', text: 'Quotes'

    click_on 'New quote'
    fill_in 'Name', with: 'Capybara quote'

    assert_selector 'h1', text: 'Quotes'
    click_on 'Create quote'

    assert_selector 'h1', text: 'Quotes'
    assert_text 'Capybara quote'
  end

  test 'Showing a quote' do
    visit quotes_path
    click_link @quote.name

    assert_selector 'h1', text: @quote.name
  end

  test 'Updating a quote' do
    visit quotes_path
    assert_selector 'h1', text: 'Quotes'

    click_on 'Edit', match: :first # Match first node element
    fill_in 'Name', with: 'Updated quote'

    assert_selector 'h1', text: 'Quotes'
    click_on 'Update quote'

    assert_selector 'h1', text: 'Quotes'
    assert_text 'Updated quote'
  end

  test 'Destroying a quote' do
    visit quotes_path
    assert_text @quote.name # Check that the page contain the text content regardless of html tags

    click_on 'Delete', match: :first
    assert_no_text @quote.name # Check that the page doesn't have the text content
  end
end
