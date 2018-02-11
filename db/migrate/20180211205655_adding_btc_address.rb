class AddingBtcAddress < ActiveRecord::Migration
  def change
    change_table :pins do |t|
      t.text :btcaddress
    end
  end
end
