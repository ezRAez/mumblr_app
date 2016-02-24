class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :mumble

  def formatted_time
    created_at.strftime("%b %-d, %Y")
  end
end
