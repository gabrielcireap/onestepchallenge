class Game < ApplicationRecord
  attribute :email, :string
  attribute :name, :string
  attribute :width, :integer
  attribute :height, :integer
  attribute :mines, :integer

  validates :email, :name, :width, :height, :mines, presence: true
  validates :width, :height, :mines, numericality: { only_integer: true, greater_than: 0 }
end
