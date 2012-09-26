class AddStateToMember < ActiveRecord::Migration
  def change
    add_column :members, :state, :string, :default => :unconfirmed
  end
end
