# frozen_string_literal: true

require "rails_helper"

describe User, type: :model do
  let!(:current_user) { create(:user, uid: "123") }
  let(:current_auth) {{
    "uid" => "123",
    "info" => {
      "name" => "existing person",
      "email" => "existing@urby.com"
    }
  }}
  let(:new_auth) {{
    "uid" => "12351352",
    "info" => {
      "name" => "ruby person",
      "email" => "ruby@urby.com"
    }
  }}

  describe "from_omniauth" do
    it "associates an existing user with the correct user" do
      user = User.from_omniauth(current_auth)
      expect(user).to eq(current_user)
    end

    it "doesnt make a duplicate user for an existing user" do
      expect { User.from_omniauth(current_auth) }.to_not change{ User.count }
    end

    it "makes a new user for a new authenticate" do
      expect { User.from_omniauth(new_auth) }.to change{ User.count }.by(1)
    end
  end
end
