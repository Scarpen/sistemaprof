class CreateAlunosDiciplinasJoinTable < ActiveRecord::Migration
  def up
  	create_table :alunos_diciplinas, :id => false do |f|
  		f.integer :aluno_id
  		f.integer :diciplina_id
  		f.integer :situacao
  	end
  end

  def down
  	drop_table :alunos_diciplinas
  end
end
