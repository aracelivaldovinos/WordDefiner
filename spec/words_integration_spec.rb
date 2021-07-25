require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an word path', {:type => :feature}) do
  it('creates a word and then goes to the home page') do
    visit('/home')
    click_on('Add words!')
    fill_in('words_word', :with => 'easy')
    click_on('click')
    expect(page).to have_content('easy')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a definition and then goes to the word page') do
    word = Word.new("easy", nil)
    word.save
    visit("/home/#{word.id}")
    fill_in('definition_text', :with => 'without difficulty or effort')
    click_on('Add!')
    expect(page).to have_content('without difficulty or effort')
  end
end


describe('create a definition path', {:type => :feature}) do
  it('creates a second definition and then goes to the word page') do
    word = Word.new("easy", nil)
    word.save
    visit("/home/#{word.id}")
    fill_in('definition_text', :with => 'without difficulty or effort')
    click_on('Add!')
    expect(page).to have_content('without difficulty or effort')
    fill_in('definition_text', :with => 'opposite of hard')
    click_on('Add!')
    expect(page).to have_content('opposite of hard')
  end
end

describe('update definition', {:type => :feature}) do
  it('updates definition and then goes to the word page') do
    word = Word.new("easy", nil)
    word.save
    visit("/home/#{word.id}")
    fill_in('definition_text', :with => 'without difficulty or effort')
    click_on('Add!')
    expect(page).to have_content('without difficulty or effort')
    fill_in('definition_text', :with => 'opposite of hard')
    click_on('Add!')
    expect(page).to have_content('opposite of hard')
    click_on('opposite of hard')
    fill_in('name', :with => 'free from worries or problems')
    click_on('Update definition')
    expect(page).to have_content('free from worries or problems')
  end
end

describe('deletes definition', {:type => :feature}) do
  it('deletes definition and then goes to the word page') do
    word = Word.new("easy", nil)
    word.save
    visit("/home/#{word.id}")
    fill_in('definition_text', :with => 'without difficulty or effort')
    click_on('Add!')
    expect(page).to have_content('without difficulty or effort')
    fill_in('definition_text', :with => 'opposite of hard')
    click_on('Add!')
    expect(page).to have_content('opposite of hard')
    click_on('opposite of hard')
    fill_in('name', :with => 'free from worries or problems')
    click_on('Update definition')
    expect(page).to have_content('free from worries or problems')
    click_on('free from worries or problems')
    click_on('Delete definition')
    expect(page).to have_content('without difficulty or effort')
  end
end

describe('create an word path', {:type => :feature}) do
  it('create another word and then goes to the home page') do
    visit('/home')
    click_on('Add words!')
    fill_in('words_word', :with => 'easy')
    click_on('click')
    expect(page).to have_content('easy')
    click_on('Add words!')
    fill_in('words_word', :with => 'hard')
    click_on('click')
    expect(page).to have_content('hard')
  end
end