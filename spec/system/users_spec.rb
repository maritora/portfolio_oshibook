require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user){FactoryBot.create(:user)}
  describe 'ユーザー認証のテスト' do
    describe 'ユーザー新規登録' do
      before do
        visit new_user_registration_path
      end
      context '新規登録画面に遷移' do
        it '新規登録に成功する' do
          fill_in 'user_name', with: "テスト"
          fill_in 'user_email', with: "test@test.com"
          fill_in 'user_password', with: "testpw"
          fill_in 'user_password_confirmation', with: "testpw"
          click_button 'アカウント作成'
          expect(page).to have_content 'アカウント登録が完了しました。'
        end
        
        it '新規登録に失敗する' do
          fill_in 'user_name', with: ""
          fill_in 'user_email', with: ""
          fill_in 'user_password', with: ""
          fill_in 'user_password_confirmation', with: ""
          click_button 'アカウント作成'
          expect(page).to have_content 'メールアドレスを入力してください'
        end
      end
    end

    describe 'ユーザーログイン' do
      before do
        visit new_user_session_path
      end
      context 'ログイン画面に遷移' do
        it 'ログインに成功する' do
          fill_in "user_email", with: user.email
          fill_in 'user_password', with: user.password
          click_button 'ログイン'
          expect(page).to have_content 'ログインしました。'
        end
        it 'ログインに失敗する' do
          fill_in 'user_email', with: ''
          fill_in 'user_password', with: ''
          click_button 'ログイン'
          expect(current_path).to eq new_user_session_path
        end
      end
    end
  end

  describe 'ユーザーのテスト' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'ログイン'
    end
    describe 'アカウント設定のテスト' do
      it 'ヘッダーにアカウント設定と表示される' do
        expect(page).to have_content('アカウント設定')
      end
      it 'アカウント設定に遷移し編集リンクが表示される' do
        visit users_account_path(user)
        expect(page).to have_content('編集')
      end
    end
    describe '編集のテスト' do
      context '編集画面へ遷移' do
        it '遷移ができる' do
          visit edit_user_registration_path(user)
          expect(current_path).to eq edit_user_registration_path(user)
        end
      end
      context '表示の確認と編集' do
        before do
          visit edit_user_registration_path(user)
        end
        it 'アカウント名編集フォームに自分のアカウント名が表示される' do
          expect(page).to have_field 'user_name', with: user.name
        end
        it 'Eメール編集フォームに自分のメールアドレスが表示される' do
          expect(page).to have_field 'user_email', with: user.email
        end
        it '編集に成功する' do
          # 名前をじろうに変更
          fill_in 'user_name', with: 'じろう'
          click_button '変更する'
          expect(current_path).to eq '/users'         
        end
        it '編集に失敗する' do
          fill_in 'user_name', with: ''
          click_button '変更する'
          expect(page).to have_content 'アカウント名を入力してください'
          expect(current_path).to eq '/users'
        end
      end
    end
  end
end
