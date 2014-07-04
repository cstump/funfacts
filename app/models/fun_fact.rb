class FunFact < ActiveRecord::Base
  validates :name, :description, presence: true

  before_create :assign_position


  private

  def assign_position
    self.position = self.class.last.try(:position).to_i + 1
  end
end
