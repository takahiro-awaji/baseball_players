require 'rails_helper'

RSpec.describe Team, type: :model do
  before do
    @team = FactoryBot.build(:team)
  end

  describe 'チーム新規登録' do
    context '新規登録がうまくいくとき' do
      it 'メールアドレス、パスワード、パスワード確認用、チーム名、チーム名カナ、チームURL、活動拠点、チーム区分が正しく入力されているとき' do
        expect(@team).to be_valid
      end
      it 'チームレベルが未選択でも登録できる' do
        @team.team_level_id = 0
        expect(@team).to be_valid
      end
      it 'チーム平均年齢が未選択でも登録できる' do
        @team.team_player_age_id = 0
        expect(@team).to be_valid
      end
      it 'メンバー野球歴が未登録でも登録できる' do
        @team.team_player_history_id = 0
        expect(@team).to be_valid
      end
      it '所属リーグ・団体・連盟等が未入力でも登録できる' do
        @team.league = nil
        expect(@team).to be_valid
      end
      it '獲得タイトルが未入力でも登録できる' do
        @team.team_title = nil
        expect(@team).to be_valid
      end
      it 'チーム結成が未選択でも登録できる' do
        @team.since_id = 0
        expect(@team).to be_valid
      end
      it '活動曜日が未選択でも登録できる' do
        @team.activity_day = nil
        expect(@team).to be_valid
      end
      it '活動ペースが未選択でも登録できる' do
        @team.activity_pace_id = 0
        expect(@team).to be_valid
      end
      it '年間試合数が未選択でも登録できる' do
        @team.games_per_year_id = 0
        expect(@team).to be_valid
      end
      it 'チームスローガンが未入力でも登録できる' do
        @team.team_slogan = nil
        expect(@team).to be_valid
      end
      it 'チーム紹介が未入力でも登録できる' do
        @team.introduction = nil
        expect(@team).to be_valid
      end
      it 'チーム画像が未選択でも登録できる' do
        @team.image = nil
        expect(@team).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'メールアドレスが未入力のとき' do
        @team.email = nil
        @team.valid?
        expect(@team.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it '同じメールアドレスがすでに登録されているとき' do
        @team.save
        another_team = FactoryBot.build(:team)
        another_team.email = @team.email
        another_team.valid?
        expect(another_team.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'パスワードが未入力のとき' do
        @team.password = nil
        @team.valid?
        expect(@team.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'パスワードとパスワード未入力用が一致しないとき' do
        @team.password = '123abc'
        @team.password_confirmation = '123aba'
        @team.valid?
        expect(@team.errors.full_messages).to include('パスワード確認用とパスワードの入力が一致しません')
      end
      it 'パスワードが5文字以下のとき' do
        @team.password = 'abcde'
        @team.valid?
        expect(@team.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'チーム名が未入力のとき' do
        @team.team_name = nil
        @team.valid?
        expect(@team.errors.full_messages).to include('チーム名を入力してください')
      end
      it 'チーム名（カナ）が未入力のとき' do
        @team.team_name_kana = nil
        @team.valid?
        expect(@team.errors.full_messages).to include('チーム名（カナ）を入力してください')
      end
      it 'チームURLが未入力のとき' do
        @team.team_url = nil
        @team.valid?
        expect(@team.errors.full_messages).to include('チームURLを入力してください')
      end
      it '同じチームURLがすでに登録されているとき' do
        @team.save
        another_team = FactoryBot.build(:team)
        another_team.team_url = @team.team_url
        another_team.valid?
        expect(another_team.errors.full_messages).to include('チームURLはすでに存在します')
      end
      it '活動拠点が未選択のとき' do
        @team.activity_base_id = 0
        @team.valid?
        expect(@team.errors.full_messages).to include('活動拠点を選択してください')
      end
      it 'チーム区分が未選択のとき' do
        @team.team_attribute_id = 0
        @team.valid?
        expect(@team.errors.full_messages).to include('チーム区分を選択してください')
      end
    end
  end
end
