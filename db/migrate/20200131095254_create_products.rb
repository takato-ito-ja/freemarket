class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string     :name   
      t.integer    :price                  
      t.text       :description            
      t.integer    :condition              
      t.integer    :postage_burden         
      t.integer    :scheduled_sending_date 
      t.integer    :size                   
      t.integer    :status                 
      t.integer    :payment_status         
      t.integer    :sending_status         
      t.integer    :recieving_status       
      t.integer    :sending_method          
      t.references :seller,                 foreign_key: { to_table: :users }
      t.references :buyer,                  foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end