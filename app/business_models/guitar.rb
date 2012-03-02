require_relative '../data_models/guitar_data_model'
require 'active_model'

class Guitar
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  validates_numericality_of :price
  validates_presence_of :brand

  attr_reader :brand, :price, :type, :color, :id

  def initialize(attrs)
    self.attributes = attrs
    @id = attrs[:id]
  end

  def store
    @id = GuitarDataModel.store(self) if valid?
    self
  end

  def update(attrs)
    self.attributes = attrs
    GuitarDataModel.update(self) if valid?
  end

  def attributes=(attrs)
    @brand = attrs[:brand]
    @price = attrs[:price]
    @type = attrs[:type]
    @color = attrs[:color]
  end

  def persisted?
    !!id
  end
end
