class CreateTuples < ActiveRecord::Migration
  def self.up
    create_table :tuples do |t|
      t.text :content
      t.string :md5, :size => 32
      t.string :sha1, :size => 40
      t.string :sha2, :size => 64

      t.timestamps
    end
  end

  def self.down
    drop_table :tuples
  end
end
