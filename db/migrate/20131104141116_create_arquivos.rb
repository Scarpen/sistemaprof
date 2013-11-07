class CreateArquivos < ActiveRecord::Migration
  def up
    create_table :arquivos do |t|
    	t.integer :diciplina_id
    	t.string :arquivo
    	t.string :nome
      t.timestamps
  	end
  end

  def down
  end
end
