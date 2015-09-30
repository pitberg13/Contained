class AddAttachmentUploadsToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :uploads
    end
  end

  def self.down
    remove_attachment :events, :uploads
  end
end
