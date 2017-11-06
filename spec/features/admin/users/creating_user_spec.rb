require 'rails_helper'

describe 'Visits the index page of users' do
  before do
    @user1 = User.create(email: 'admin@kbc.com', password: 'kbc@1234', admin: true, phone_number: '9012345678', name: 'Admin', city: 'Bangalore')
    @user2 = User.create(email: 'user@kbc.com', password: 'kbc@1234', admin: false, phone_number: '9012345678', name: 'Admin', city: 'Bangalore')
  end

  scenario 'Filling all required details' do
    login_as(@user1)
    visit 'admin/users/new'
    fill_in "Email", with: 'sample@ex.com'
    fill_in "Name", with: 'sample'
    fill_in "Phone number", with: '9012345678'
    fill_in 'City', with: 'Bangalore'

    click_button 'Create User'
    expect(page).to have_current_path(admin_users_path)

    within('.alert') do
      expect(page).to have_content('User Created successfully')
    end
  end

  scenario 'Not filling email' do
    login_as(@user1)
    visit 'admin/users/new'
    fill_in "Email", with: ''
    fill_in "Name", with: 'sample'
    fill_in "Phone number", with: '9012345678'
    fill_in 'City', with: 'Bangalore'

    click_button 'Create User'

    within('.list-group') do
      expect(page).to have_content("Email can't be blank")
    end
  end

  scenario 'Not entering the mobile number'do
    login_as(@user1)
    visit 'admin/users/new'
    fill_in "Email", with: 'sample@ex.com'
    fill_in "Name", with: 'sample'
    fill_in "Phone number", with: ''
    fill_in 'City', with: 'Bangalore'

    click_button 'Create User'


    within('.list-group') do
      expect(page).to have_content("Phone number can't be blank")
    end
  end

  scenario 'repeating the email' do
    login_as(@user1)
    visit 'admin/users/new'
    fill_in "Email", with: 'user@kbc.com'
    fill_in "Name", with: 'sample'
    fill_in "Phone number", with: '9012345678'
    fill_in 'City', with: 'Bangalore'

    click_button 'Create User'


    within('.list-group') do
      expect(page).to have_content("Email has already been taken")
    end
  end
end
