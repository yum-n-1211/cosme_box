# frozen_string_literal: true

require 'rails_helper'

describe 'モデルのテスト' do
  it "有効な内容の場合はユーザー登録されるか" do
    expect(FactoryBot.build(:user)).to be_valid
  end
end