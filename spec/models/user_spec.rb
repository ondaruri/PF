require 'rails_helper'

RSpec.describe "User モデルのテスト", type: :model do
  it "アドレス、パスワード入力すると、会員登録ができる" do
    user = User.new(email: "zzz@zzz", password: "zzzzzz")
    expect(user).to be_valid
  end
  
  
  
end