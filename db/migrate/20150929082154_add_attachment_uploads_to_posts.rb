class AddAttachmentUploadsToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :uploads
    end
  end

  def self.down
    remove_attachment :posts, :uploads
  end
end
