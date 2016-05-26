class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:account]

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :age, :sex, :city, :zip_code, :username, :security_question, :security_answer,
  :access_token, :device_token, :status, :is_active, :notify_sms, :notify_email, :notify_new_msg, :meet_now, :logged_day, :is_disable, :notify_via_app, :notify_via_sms,
  :notify_via_email, :turn_off_time, :turn_on_start, :turn_on_end

  validates_uniqueness_of :username

  attr_accessor :account

  after_create :generate_token

  has_many :user_sports
  has_many :sports, through: :user_sports

  has_many :user_gyms
  has_many :gyms, through: :user_gyms

  has_many :user_outdoor_places
  has_many :outdoor_places, through: :user_outdoor_places

  has_many :user_workouts
  has_many :workouts, through: :user_workouts

  has_many :user_events
  has_many :events, through: :user_events
  
  has_many :friendships
  has_many :friends, through: :friendships

  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_many :blocks
  has_many :reports, through: :blocks

  has_many :photos

  has_many :check_ins

  has_many :user_preferences

  has_many :motivates

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:account)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  def self.authenticate_user(token)
    user = self.where("access_token = ?", token).last

    if user.present?
      return true, user
    else
      return false, []
    end
  end

  def friend(other_user)
    friendships.create(friend_id: other_user.id)
  end

  def unfriend(other_user)
    friend = inverse_friendships.present? ? inverse_friendships.find_by_user_id(other_user.id) : []
    if friend.present?
      friend.destroy
    else
      friend = friendships.find_by_friend_id(other_user.id).destroy
    end
  end

  def friends?(other_user)
    found = false
    if friends.include?(other_user) || inverse_friends.include?(other_user)
      found = true
    end

    return found
  end

  def partners
    friends = Friendship.find_by_sql(["select CASE WHEN user_id = '#{self.id}' THEN friend_id WHEN friend_id = '#{self.id}' THEN user_id END as id from friendships where user_id = ? or friend_id = ? order by friendships.created_at asc", self.id, self.id])
    
    return User.where("id IN (?)", friends)
  end

  def block(other_user, is_report)
    blocks.create(report_id: other_user.id, is_report: is_report)
  end

  def blocked?(other_user, is_report)
    if reports.where("report_id = ? and is_report = ?", other_user.id, is_report).present?
      return true
    else
      return false
    end
  end

  def delete_floating_records
    #to be follow
  end
  
  private
    def generate_token
      secret = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64)
      self.access_token = User.find_by_access_token(secret.to_s) ? generate_token : secret
      self.save
    end
end
