class Portfolioo < ActiveRecord::Base
belongs_to :user
validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image



  #Custom Scope (need to create route with it)
  def self.ROR
    where(subtitle: 'ROR')
  end

  #or

  scope :ruby_on_rails, -> {
    where(subtitle: 'ROR')
  }

  mount_uploader :main_image, PictureUploader

  #If nothing is passed for main image or thumb image, these will be the
  #defaults
  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "http://placehold.it/200x200"
    self.thumb_image ||= "http://placehold.it/200x200"
  end

end
