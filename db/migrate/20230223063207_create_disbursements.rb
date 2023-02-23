class CreateDisbursements < ActiveRecord::Migration[6.0]
  def change
    create_table :disbursements do |t|
      t.references :merchant, null: false, foreign_key: true
      t.decimal :fee
      t.datetime :calculated_at
      t.datetime :calculated_since
      t.datetime :calculated_to

      t.timestamps
    end
  end
end
