require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  let(:user) { create(:user, reset_password_token: 'dummy_token') }

  describe '#reset_password_email' do
    let(:mail) { UserMailer.reset_password_email(user) }

    it '正しい宛先にメールが生成されること' do
      expect(mail.to).to eq([ user.email ])
      expect(mail.subject).to eq('パスワードリセットのご案内')
    end

    it 'メール本文にパスワードリセットURLが含まれていること' do
      expect(mail.body.encoded).to include(edit_password_reset_url(user.reset_password_token))
    end
  end
end
