require 'rails_helper'

RSpec.describe AuthenticateUser do
  let(:user) { create :user, password: 'password' }
  subject(:valid_auth) { described_class.new(user.email, 'password') }
  subject(:invalid_auth) { described_class.new('foo', 'bar') }

  describe ".call" do
    context "when valid credentials" do
      it "return an auth token" do
        token = valid_auth.call
        expect(token.result).not_to be_nil
      end
    end

    context "when invalid credentials" do
      it "raises an authentication error" do
        result = invalid_auth.call
        expect(result.errors[:user_authentication]).to eq ["Invalid credentials"]
      end
    end
  end
end
