class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    t.string :name, null: false
    t.string :uid, null: false
    t.string :provider, null: false  #must equal spotify?????
    end
  end
end
