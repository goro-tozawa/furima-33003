class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string          :item_name
      t.text             :details
      t.integer        :category_id
      t.integer        :state_id
      t.integer        :burden_id
      t.integer        :area_id
      t.integer        :day_id
      t.string          :price
      t.references   :user

      t.timestamps
    end
  end
end
