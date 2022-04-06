class CreateDnaSequences < ActiveRecord::Migration[7.0]
  def change
    create_table :dna_sequences do |t|
      t.string :dna, array: true, default: []
      t.integer :category, default: 0

      t.timestamps
    end
  end
end
