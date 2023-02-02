class CreateErrors < ActiveRecord::Migration[6.1]
  def change
    create_table :errors do |t|

      t.timestamps
    end
  end
end
