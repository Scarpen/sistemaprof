class CreateAtividades < ActiveRecord::Migration
  def change
    create_table :atividades do |t|
      t.string :diciplina_id
      t.float :nota_maxima
      t.string :descricao
      t.datetime :prazo
      
      t.timestamps
    end
  end
end
