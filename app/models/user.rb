class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :api_tokens, -> { order "created_at desc" }

  has_many :posts

  has_many :api_requests

  # DONE: how to define constants in ruby?
  # Constant is available within the scope of current class and can be access unadorned.
  MAX_API_REQUEST_PER_30_DAYS = 50

  def api_request_count_within_last_30_days
    # DONE: I wonder what returns for the `ago` method
    # `ago` returns `Time/Date` while `ago` return a `Duration`
    api_requests.where("created_at > ?", 30.days.ago).count
  end

  def api_request_limit_exceeded?
    api_request_count_within_last_30_days > MAX_API_REQUEST_PER_30_DAYS
  end

  def remaining_api_request_count
    MAX_API_REQUEST_PER_30_DAYS - api_request_count_within_last_30_days
  end
end
