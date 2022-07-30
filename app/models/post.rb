class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :title_is_clickbait?

    TITLES_REG = [
        /Won't Believe/i,
        /Sectret/i,
        /Top \d/i,
        /Guess/i
    ]

    def title_is_clickbait?
        if TITLES_REG.none? { |title_reg| title_reg.match title }
            errors.add(:title, "Check out the clickbait!")
        end
    end
end
