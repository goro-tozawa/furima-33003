class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string          :item_name
      t.text             :details
      t.integer        :category_id                   , null: false
      t.integer        :state_id                         , null: false
      t.integer        :burden_id                      , null: false
      t.integer        :area_id                          , null: false
      t.integer        :day_id                           , null: false
      t.integer        :price
      t.references   :user

      t.timestamps
    end
  end
end
