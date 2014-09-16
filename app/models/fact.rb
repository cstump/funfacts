class Fact < ActiveRecord::Base
  has_and_belongs_to_many :regions
  has_and_belongs_to_many :datasets

  validates :name, :description, presence: true
  validate :has_a_dataset, :has_a_region

  before_save :assign_position

  default_scope { order('position ASC') }


  private

  def assign_position
    self.position ||= self.class.last.try(:position).to_i + 1
  end

  def has_a_dataset
    errors.add :datasets, I18n.t('errors.no_datasets') if datasets.empty?
  end

  def has_a_region
    errors.add :regions, I18n.t('errors.no_regions') if regions.empty?
  end
end
