require 'rails_helper'

describe 'Visits the index page of users' do
  before do
    @user1 = User.create(email: 'admin@kbc.com', password: 'kbc@1234', admin: true, phone_number: '9012345678', name: 'Admin', city: 'Bangalore')
    @user2 = User.create(email: 'user@kbc.com', password: 'kbc@1234', admin: false, phone_number: '9012345678', name: 'User', city: 'Bangalore')
  end

  scenario 'Lists all users if User is admin' do
    login_as(@user1)
    visit 'admin/users'
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user1.email)
    expect(page).to have_content(@user1.city)
    expect(page).to have_content(@user1.phone_number)

    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user2.email)
    expect(page).to have_content(@user2.city)
    expect(page).to have_content(@user2.phone_number)

    within('.nav') do
      expect(page).to have_content('Users')
      expect(page).to have_content('Tests')
    end
  end

  scenario 'Lists all users if User is admin' do
    login_as(@user2)
    visit 'admin/users'
    expect(page).to have_current_path(root_path)

    within("h1.bold-warning-title") do
      expect(page).to have_content('Kaun banega Crorepathi')
    end
    within(".nav") do
      expect(page).to have_content('Log Out')
    end
  end


end
