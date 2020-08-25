
require 'rails_helper'


Rspec.describe 'static_pagesへのアクセス', type: :request do
  context 'GET #home' do
    before { get root_path }
    it 'responds successfully' do
      expect(response).to have_http_status 200
    end 

    it "has title '日本SECRET案内'" do
      expect(response.body).to include full_title('')
      expect(response.body).to_not include '日本SECRET案内'
    end 
  end

context 'GET #help' do
  before { get help_path }
  it 'responds successfully' do
    expect(response).to have_http_status 200
  end 

  it "has title 'Home | 日本SECRET案内'" do
    expect(response).to include full_title('Help')
  end 
end 

context 'GET #about' do
  before { get about_path }
  it 'responds successfully' do
    expect(response).to have_http_status 200
  end 
  it "has title 'Home |  日本SECRET案内'" do
    expect(response).to include full_title('日本SECRET案内について')
  end 
end
end



    



      

