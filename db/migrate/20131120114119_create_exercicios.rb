class CreateExercicios < ActiveRecord::Migration
  def change
    create_table :exercicios do |t|
      t.integer :aluno_id
      t.integer :atividade_id
      t.float :nota
      t.string :arquivo

      t.timestamps
    end
  end
end
