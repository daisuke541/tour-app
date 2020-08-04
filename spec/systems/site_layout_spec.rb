require 'rails_helper'

Rspec.describe 'site layout', type: :system do
  context 'access to root_path' do
    before { visit root_path }
    subject_page
    it 'has links sach as root_path, help_path and about_path' do
      is_expected.to have_link nil, href: root_path, count: 2
      is_expected.to have_link 'ヘルプ', href: help_path
      is_expected.to have_link '日本SECRET案内について', href: about_path
   
  context 'access to signup_path' do
    before { visit signup_path }
    subject { page }
    it "has 'ログイン' contens and includes 'ログイン' at title" do 
    is expected.to have_content 'ログイン'
    is expected.to have_title full_title('ログイン')
    end 
  end 
end 



