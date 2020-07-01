class Candidate < ApplicationRecord
    validates :name,presence: true
    validates :age,presence: true
    validates :party,presence: true
    validates :politics,presence: true
    has_many :votelogs
end
