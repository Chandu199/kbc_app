require 'rails_helper'

describe 'Landingpage content', :type => :views do
  it 'visits the homepage' do
    visit "/"
    expect(page).to have_content 'Kaun banega Crorepathi'
  end

end
