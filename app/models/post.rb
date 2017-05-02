class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait

  WORDS = [
    /Won't Believe/,
    /Secret/,
    /Guess/
  ]

  def clickbait
    if WORDS.none? { |word| word.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
