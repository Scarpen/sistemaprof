class CreateArquivos < ActiveRecord::Migration
  def up
    create_table :arquivos do |t|
    	t.integer :pasta_id
    	t.string :arquivo
    	t.string :nome
      t.timestamps
  	end
  end

  def down
  end
end
