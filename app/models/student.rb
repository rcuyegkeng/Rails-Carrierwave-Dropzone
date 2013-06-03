class Student < ActiveRecord::Base
  attr_accessible :age, :name, :imagefile

  mount_uploader :imagefile, ImageUploader

  validates :name, :presence => true
  validates :age, :presence => true, :numericality => { :only_integer => true }
end
