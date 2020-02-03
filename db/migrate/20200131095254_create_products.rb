class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :seller_id,               null: false, foreign_key: { to_table: :users }
      t.string     :name,                    null: false
      t.integer    :price,                   null: false
      t.text       :description,             null: false
      t.integer    :condition,               null: false
      t.integer    :postage_burden,          null: false
      t.integer    :scheduled_sending_date,  null: false
      t.integer    :size,                    null: false
      t.integer    :status,                  null: false
      t.references :buyer_id,                foreign_key: { to_table: :users }
      t.timestamps :buyed_time
      t.integer    :payment_method,          null: false
      t.integer    :payment_status,          null: false
      t.integer    :sending_status,          null: false
      t.integer    :recieving_status,        null: false
      t.integer    :sending_methods,         null: false

      # t.timestamps 

    end
  end
end
     