# frozen_string_literal: true

class Game < ApplicationRecord
  attribute :email, :string
  attribute :name, :string
  attribute :width, :integer
  attribute :height, :integer
  attribute :mines, :integer
  attribute :config, :integer, array: true

  validates :email, :name, :width, :height, :mines, presence: true
  validates :width, :height, :mines, numericality: { only_integer: true, greater_than: 0 }

  scope :last_ordered, -> (number) { order(created_at: :desc).limit(number) }
end
