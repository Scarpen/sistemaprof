class CreateControles < ActiveRecord::Migration
  def change
    create_table :controles do |t|
      t.integer :aluno_id
      t.integer :diciplina_id
      t.integer :situacao
      
      t.timestamps
    end
  end
end
