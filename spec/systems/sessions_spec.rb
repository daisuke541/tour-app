
require 'rails_helper'

Rspec.describe 'Sessions', type: :system do

  before do
    visit login_path
  end 

  describe 'enter an invalid values' do
    before do
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      click_button 'log_in'
    end
   
   describe 'enter an valid values' do
    let!(:user) { create(:user, email: 'loginuser@example.com', password: 'password') }
    before do
      fill_in 'Email', with: 'loginuser@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    subject { page }
    
    it 'log in' do
      is_expected.to have_current_path user_path(user)
      is_expected.to_not have_link nil, href: login_path
      click_link 'アカウント'
      is_expected.to have_link 'プロフィール', href: user_path(user)
      is_expected.to have_link 'ログアウト', href: logout_path
    end

    it 'log out after log in' do
      click_link 'アカウント'
      click_link 'ログアウト'
      is_expected.to have_current_path root_path
      is_expected.to have_link 'ログイン', href: login_path
      is_expected.to_not have_link 'アカウント'
      is_expected.to_not have_link nil, href: logout_path
      is_expected.to_not have_link nil, href: user_path(user)
    end
  end

    it 'gets an flash messages' do
      is_expected.to have_selector('.alert-danger', text: 'Invalid email/password combination')
      is_expected.to have_current_path login_path
    end 

    context 'access to other page' do
      before { visit root_path }

      it 'is flash disappear' do
        is_expected.to_not have_selector('.alert-danger', text: 'Invalid email/password combination')
      end 
    end
  end
end

