require 'rails_helper'

describe 'Landingpage content', :type => :controller do

  it 'visits the homepage' do
    visit "/"
    expect(page).to have_content 'Kaun banega Crorepathi'
    expect(page).to have_content 'Play Game'
  end
  
end
