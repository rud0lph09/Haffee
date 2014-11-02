class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :orders, :sweetenerintesity, :sweetenerintensity
  end
end
