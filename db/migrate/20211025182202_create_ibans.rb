class CreateIbans < ActiveRecord::Migration[6.1]
  def change
    create_table :ibans do |t|
      t.string :name
      t.string :iban_number

      t.timestamps
    end
  end
end
