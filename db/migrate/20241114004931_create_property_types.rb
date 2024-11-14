# frozen_string_literal: true

class CreatePropertyTypes < ActiveRecord::Migration[8.0]
  def change
    # Habilita UUIDs para o PostgreSQL
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :property_types, id: :uuid do |t|
      t.string :name, limit: 50, null: false

      t.timestamps
    end
    add_index :property_types, :name, unique: true
  end
end
