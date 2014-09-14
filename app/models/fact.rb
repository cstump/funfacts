class Fact < ActiveRecord::Base
  has_and_belongs_to_many :datasets

  validates :region, :name, :description, presence: true
  validate :has_a_dataset

  before_save :assign_position


  private

  def assign_position
    self.position ||= self.class.last.try(:position).to_i + 1
  end

  def has_a_dataset
    errors.add :datasets, I18n.t('errors.no_datasets') if datasets.empty?
  end
end
