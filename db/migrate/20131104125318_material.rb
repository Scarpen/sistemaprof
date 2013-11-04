class Material < ActiveRecord::Migration
  def up
  	create_table :files, :id => false do |f|
  		f.string :file
  		f.integer :diciplina_id
  	end
  end

  def down
  	drop_table :files
  end
end
