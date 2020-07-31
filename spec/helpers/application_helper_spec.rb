
require 'rails _hepler'

Rspec.describe ApplicationHelper, type: :helper do
  describe '#full_title' do
    it { expect(full_tilte('')).to eq '日本SECRET案内' }
    it { expect(full_title('日本SECRET案内について')).to eq 'Help | 日本SECRET案内について' }
