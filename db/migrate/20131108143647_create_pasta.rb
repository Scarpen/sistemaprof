class CreatePasta < ActiveRecord::Migration
  def change
    create_table :pasta do |t|
      t.string :nome
      t.integer :diciplina_id

      t.timestamps
    end
  end
end
