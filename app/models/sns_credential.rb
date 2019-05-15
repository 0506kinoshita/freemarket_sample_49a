class SnsCredential < ApplicationRecord
  belongs_to :user

  validates :uid, presence: true, uniqueness: true
  validates :provider, presence: true

  def find_sns(oauth)
    uid = oauth.uid
    provider = oauth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    return snscredential
  end

  def create_sns(oauth)
    user = User.where(email: oauth.info.email).first
    SnsCredential.create(
      uid: oauth.uid,
      provider: oauth.provider,
      user_id: user.id
    )
    return user
  end

  def check_sns(snscredential_user, oauth)
    if snscredential_user.present?
      @user = User.where(id: snscredential_user.user_id).first
    else
      snscredential = SnsCredential.new
      @user = snscredential.create_sns(oauth)
    end
    return @user
  end
end
