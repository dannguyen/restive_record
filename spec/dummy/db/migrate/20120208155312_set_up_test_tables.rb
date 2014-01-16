class SetUpTestTables < ActiveRecord::Migration
  def self.up


    create_table :articles, :force => true do |t|
      t.string :title
      t.string :content
      t.string :abstract
      t.string :file_upload
    end

  end

  def self.down
    drop_table :articles
  end
end
