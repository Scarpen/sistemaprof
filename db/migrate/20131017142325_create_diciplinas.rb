class CreateDiciplinas < ActiveRecord::Migration
  def change
    create_table :diciplinas do |t|
      t.string :nome
      t.string :conteudo
      t.integer :professor_id

      t.timestamps
    end
  end
end
