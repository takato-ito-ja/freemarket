class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|

      t.references :seller_id,      null: false, foreign_key: { to_table: :users }
      t.string     :name,           null: false
      t.references :category_id,    null: false, foreign_key: true
      t.references :brand_id,       null: false
      t.integer    :price,          null: false
      t.text       :description,    null: false
      t.references :condition,      null: false, foreign_key: true
      t.integer    :postage_burden, null: false
      t.references :area_id,        null: false, foreign_key: true
      t.integer    :scheduled_sending_date, null: false
      t.references :size,           null: false
      t.integer    :status,         null: false
      t.references :buyer_id,       foreign_key: { to_table: :users }
      t.timestamps :buyed_time
      t.integer    :payment_method, null: false
      t.integer    :payment_status, null: false
      t.integer    :sending_status, null: false
      t.integer    :recieving_status, null: false
      t.integer    :sending_methods, null: false


      # default
      t.timestamps 

    end
  end
end
