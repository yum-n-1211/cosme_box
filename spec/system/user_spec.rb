# frozen_string_literal: true

require 'rails_helper'

describe '会員登録のテスト' do
  let!(:user) { create(:user, nickname:'aya', birthday:'19920909', sex: 0, personal_color: 1, skin_quality: 1,
                introduction:'よろしく', email:'sample@examle.jp', password:'asd123', password_confirmation:'asd123') }
  describe 'トップ画面(root_path)のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
      it 'トップ画面(root_path)に「新規会員登録」ボタンが表示されているか' do
        expect(page).to have_content '新規登録'
      end
      it 'トップ画面(root_path)に「ログイン」ボタンが表示されているか' do
        expect(page).to have_content 'ログイン'
      end
      it 'root_pathが"/"であるか' do
        expect(current_path).to eq('/')
      end
    end
  end

  describe "新規登録画面(new_user_registration_path)のテスト" do
    before do
      visit new_user_registration_path
    end
    context '表示の確認' do
      it 'new_user_registration_pathが"/users/sign_up"であるか' do
        expect(current_path).to eq('/users/sign_up')
      end
      it '登録ボタンが表示されているか' do
        expect(page).to have_button 'ユーザー登録'
      end
    end
    context '登録処理のテスト' do
      it '登録後のリダイレクト先は正しいか' do
        fill_in 'user[nickname]', with: Faker::Name.name
        fill_in 'user[birthday]', with: Faker::Date.birthday(min_age: 18, max_age: 65)
        select 'woman', from: 'user[sex]'
        select 'イエベ春', from: 'user[personal_color]'
        select '乾燥肌', from: 'user[skin_quality]'
        fill_in 'user[introduction]', with: Faker::Lorem.characters(number:10)
        fill_in 'user[email]', with: Faker::Internet.free_email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button 'ユーザー登録'
        expect(page).to have_current_path mypage_path
      end
    end
  end

endgi