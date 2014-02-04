class Prazo < ActiveRecord::Migration
  def up
  	add_column :atividades, :prazo, :datetime
  end

  def down
  end
end
