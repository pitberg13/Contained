class CreateFeatureds < ActiveRecord::Migration
  def change
    create_table :featureds do |t|

      t.timestamps null: false
    end
  end
end
