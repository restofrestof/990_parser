class AddTables < ActiveRecord::Migration[6.0]
  def change
    create_table :granters, id: :uuid do |t|
      t.string :ein, null: false
      t.string :name, null: false
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.timestamps
    end

    create_table :filings, id: :uuid do |t|
      t.string :status, null: false
      t.references :granter, index: true, null: true
      t.integer :awards_processed
      t.integer :tax_year
      t.json :award_errors
      t.text :original_file
      t.timestamps
    end

    create_table :recipients, id: :uuid do |t|
      t.string :ein
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :section
      t.timestamps
    end

    create_table :awards, id: :uuid do |t|
      t.float :amount, null: false
      t.string :purpose, null: false
      t.integer :tax_year, null: false
      t.references :granter, index: true
      t.references :filing, index: true
      t.references :recipient, index: true
      t.timestamps
    end
  end
end
