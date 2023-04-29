require 'rails_helper'

RSpec.describe "Profiles", type: :system do

  describe 'プロフィールのテスト' do
    let(:user){FactoryBot.create(:user)}
    let(:profile){FactoryBot.create(:profile, user: user)}
    before do
      visit new_user_session_path
      fill_in "user_email", with: user.email
      fill_in 'user_password', with: user.password
      click_button 'ログイン'
    end
    describe '一覧画面のテスト' do
      context 'プロフィール一覧画面に遷移' do
        it '遷移する' do
          click_on 'みんなの推し一覧へ'
          expect(page).to have_content "みんなの推しプロフィール一覧"
          expect(current_path).to eq profiles_path
        end
      end
    end

    describe '投稿のテスト' do
      before do
        visit profiles_path
      end
      context '新規プロフィール作成ページへ遷移' do
        it '遷移する' do
          click_on 'プロフィール作成'
          expect(page).to have_content "新規プロフィール作成"
          expect(current_path).to eq new_profile_path
        end
      end
      context '表示の確認' do
        before do
          visit new_profile_path
        end
        it 'SNS入力フォームが表示される' do
          expect(page).to have_field 'profile_sns'
        end
        it '画像投稿フォームが表示される' do
          expect(page).to have_field 'profile[image]'
        end
        it '推しの名前フォームが表示される' do
          expect(page).to have_field 'profile_oshi_name'
        end
        it '推しの呼び方フォームが表示される' do
          expect(page).to have_field 'profile_call'
        end
        it '推しは何をしてる人？フォームが表示される' do
          expect(page).to have_field 'profile_job'
        end
        it '推しの好きなところフォームが表示される' do
          expect(page).to have_field 'profile_favorite_point'
        end
        it 'きっかけフォームが表示される' do
          expect(page).to have_field 'profile_reason'
        end
        it '推しとの日常フォームが表示される' do
          expect(page).to have_field 'profile_every'
        end
        it 'これからの推し活フォームが表示される' do
          expect(page).to have_field 'profile_future'
        end
        it 'フリースペースフォームが表示される' do
          expect(page).to have_field 'profile_free'
        end
        it 'カラー選択フォームが表示される' do
          expect(page).to have_field 'profile_color'
        end
        it '公開ラジオボタンが表示される' do
          expect(page).to have_field 'profile_is_published_flag_true'
        end
        it '非公開ラジオボタンが表示される' do
          expect(page).to have_field 'profile_is_published_flag_false'
        end
        it '作成ボタンが表示される' do
          expect(page).to have_button 'プロフィール作成する！'
        end
        it '戻るボタンが表示される' do
          expect(page).to have_content('一覧に戻る')
        end
      end
      context 'プロフィールの作成' do
        before do
          visit new_profile_path
        end
        it '登録に成功する' do
          fill_in 'profile_sns', with: "テスト2"
          attach_file 'profile[image]', "#{Rails.root}/spec/fixtures/images/test.jpeg"
          fill_in 'profile_oshi_name', with: "テスト2"
          fill_in 'profile_call', with: "テスト2"
          fill_in 'profile_job', with: "テスト2"
          fill_in 'profile_favorite_point', with: "テスト2"
          fill_in 'profile_reason', with: "テスト2"
          fill_in 'profile_every', with: "テスト2"
          fill_in 'profile_future', with: "テスト2"
          fill_in 'profile_free', with: "テスト2"
          fill_in 'profile_color', with: "#000000"
          choose "profile_is_published_flag_true"
          click_on 'プロフィール作成する！'
          expect(page).to have_content '登録が完了しました。'
        end
        it '登録に失敗する' do
          fill_in 'profile_oshi_name', with: ""
          click_on 'プロフィール作成する！'
          expect(page).to have_content "登録できませんでした。"
        end
      end
    end
  
    describe 'プロフィールの編集' do
      before do
        visit new_profile_path
        fill_in 'profile_oshi_name', with: profile.oshi_name
        fill_in 'profile_call', with: profile.call
        fill_in 'profile_job', with: profile.job
        fill_in 'profile_favorite_point', with: profile.favorite_point
        choose "profile_is_published_flag_true"
      end
      context '各画面へ遷移の確認' do
        before do
          visit profiles_path
        end
        it '詳細画面へ遷移ができる' do
          click_link "プロフィール画像"
          expect(current_path).to eq profile_path(profile)
        end
        it '編集画面への遷移ができる' do
          visit profile_path(profile)
          click_on "編集"
          expect(page).to have_content "プロフィール編集"
          expect(current_path).to eq edit_profile_path(profile)
        end
      end
      context '表示及び編集の確認' do
        before do
          visit edit_profile_path(profile)
        end
        it 'SNS入力フォームが表示される' do
          expect(page).to have_field 'profile_sns', with: profile.sns
        end
        it '画像投稿フォームが表示される' do
          expect(page).to have_field 'profile[image]'
        end
        it '推しの名前フォームが表示される' do
          expect(page).to have_field 'profile_oshi_name', with: profile.oshi_name
        end
        it '推しの呼び方フォームが表示される' do
          expect(page).to have_field 'profile_call', with: profile.call
        end
        it '推しは何をしてる人？フォームが表示される' do
          expect(page).to have_field 'profile_job', with: profile.job
        end
        it '推しの好きなところフォームが表示される' do
          expect(page).to have_field 'profile_favorite_point', with: profile.favorite_point
        end
        it 'きっかけフォームが表示される' do
          expect(page).to have_field 'profile_reason', with: profile.reason
        end
        it '推しとの日常フォームが表示される' do
          expect(page).to have_field 'profile_every', with: profile.every
        end
        it 'これからの推し活フォームが表示される' do
          expect(page).to have_field 'profile_future', with: profile.future
        end
        it 'フリースペースフォームが表示される' do
          expect(page).to have_field 'profile_free', with: profile.free
        end
        it 'カラー選択フォームが表示される' do
          expect(page).to have_field 'profile_color', with: profile.color
        end
        it '公開ラジオボタンが表示される' do
          expect(page).to have_field 'profile_is_published_flag_true'
        end
        it '非公開ラジオボタンが表示される' do
          expect(page).to have_field 'profile_is_published_flag_false'
        end
        it '保存ボタンが表示される' do
          expect(page).to have_button '変更を保存する!'
        end
        it '戻るボタンが表示される' do
          expect(page).to have_content('一覧に戻る')
        end
        it '編集に成功する' do
          fill_in 'profile_call', with: "てっちゃん"
          choose "profile_is_published_flag_true"
          click_on '変更を保存する!'
          expect(page).to have_content '変更が完了しました！'
          expect(current_path).to eq profile_path(profile)
        end
        it '編集に失敗する' do
          fill_in 'profile_call', with: ""
          click_on '変更を保存する!'
          expect(page).to have_content '変更できませんでした。'
        end
      end
    end

    describe 'プロフフィール閲覧画面' do
      before do
        visit profiles_path
      end
      context '自分の投稿一覧' do
        it '遷移できる' do
          click_on '自分の投稿一覧'
          expect(page).to have_content "作成履歴"
          expect(current_path).to eq profiles_myprofile_path
        end
      end
    end
  end
end