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
    user = User.where(email: auth.info.email).first
    SnsCredential.create(
      uid: oauth.uid,
      provider: oauth.provider,
      user_id: user.id
    )
    return user
  end

  def check_sns(snscredential, oauth)
    if snscredential.present?
      @user = User.where(id: snscredential.user_id).first
    else
      @user = SnsCredential.create_sns(oauth)
    end
    return @user
  end
end
