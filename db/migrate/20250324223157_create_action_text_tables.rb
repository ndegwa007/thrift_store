class CreateActionTextTables < ActiveRecord::Migration[6.0]
  def change
    create_table :action_text_rich_texts do |t|
      t.string     :name, null: false
      t.text       :body
      t.references :record, polymorphic: true, index: false, null: false

      t.timestamps
    end

    add_index :action_text_rich_texts, [:record_type, :record_id, :name], unique: true, name: "idx_action_text_rich_texts"

  end
end

