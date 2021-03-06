class Mumble < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validate :image_or_text

  def self.iterate_every(step, starting=0)
    every = all
    total = every.length - 1
    (starting..total).step(step) { |i| yield every[i] }
  end

  def self.all
    super.order created_at: :desc
  end

  def self.search(pattern)
    pattern.blank? ? self.all : self.joins(:user).where(
      'lower(text) LIKE ? OR lower(tags) LIKE ? OR lower(handle) LIKE ?',
      "%#{pattern}%".downcase, "%#{pattern}%".downcase, "%#{pattern}%".downcase
    )
  end

  def has_image?
    image_uri && !image_uri.empty?
  end

  def has_text?
    text && !text.empty?
  end

  def image_or_text
    if !has_text? && !has_image?
      errors.add :image_or_text, "must exist."
    end
  end

  def formatted_time
    created_at.strftime("%b %-d, %Y")
  end

  def comments_count
    @count ||= comments.count
  end

  def has_comments?
    comments_count > 0
  end
end
