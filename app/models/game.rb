class Game < ApplicationRecord
  attribute :email, :string
  attribute :name, :string
  attribute :width, :integer
  attribute :height, :integer
  attribute :mines, :integer
  attribute :config, :jsonb

  validates :email, :name, :width, :height, :mines, :config, presence: true
  validates :width, :height, :mines, numericality: { only_integer: true, greater_than: 0 }

  def config
    JSON.parse self[:config]
  end
end
