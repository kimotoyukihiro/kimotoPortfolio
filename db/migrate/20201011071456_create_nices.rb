class CreateNices < ActiveRecord::Migration[5.2]
  def change
    create_table :nices do |t|

      t.timestamps
    end
  end
end
