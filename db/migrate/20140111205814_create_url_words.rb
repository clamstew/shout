class CreateUrlWords < ActiveRecord::Migration
  def change
    create_table :url_words do |t|
      t.string :word
      t.datetime :expire_date
      t.references :link, index: true

      t.timestamps
    end
  end
end
