class AddTopicReferenceToBlogs < ActiveRecord::Migration
  def change
    add_reference :blogs, :topic, index: true, foreign_key: true
  end
end
