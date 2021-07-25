require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/home')
    click_on('Add words!')
    fill_in('words_word', :with => 'easy')
    click_on('click')
    expect(page).to have_content('easy')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    word = Word.new("easy", nil)
    word.save
    visit("/home/#{word.id}")
    fill_in('definition_text', :with => 'without difficulty or effort')
    click_on('Add!')
    expect(page).to have_content('without difficulty or effort')
  end
end