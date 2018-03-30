class Blog < ActiveRecord::Base
  belongs_to :topic

  validates_presence_of :title, :body, :topic_id
end
