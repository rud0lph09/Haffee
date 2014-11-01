class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :coffeebean
      t.float :coffeeintensity
      t.text :sweetenertype
      t.float :sweetenerintesity
      t.text :creamtype
      t.float :creamamount

      t.timestamps
    end
  end
end
