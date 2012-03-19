class CreateProjetos < ActiveRecord::Migration
  def change
    create_table :projetos do |t|
      t.string :nome
      t.text :descricao
      t.integer :usuario_id

      t.timestamps
    end
  end
end
