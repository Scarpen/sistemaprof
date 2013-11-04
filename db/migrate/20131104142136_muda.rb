class Muda < ActiveRecord::Migration
  def up
  	add_column :arquivos, :avatar, :string
  end

  def down
  end
end
