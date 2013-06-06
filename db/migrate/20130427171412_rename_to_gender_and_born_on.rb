class RenameToGenderAndBornOn < ActiveRecord::Migration
  def up
    add_column :users, :gender, :string
    User.where(sex: nil).update_all(gender: :male)
    User.where(sex: 0).update_all(gender: :male)
    User.where(sex: 1).update_all(gender: :female)
    remove_column :users, :sex
    #
    rename_column :users, :born_at, :born_on
  end

  def down
    raise "no turning back here"
  end
end
