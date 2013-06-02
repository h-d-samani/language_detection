class ModifyLanguagesModel < ActiveRecord::Migration
  def up
    add_column :languages, :file_file_name, :string
    add_column :languages, :file_content_type, :string
    add_column :languages, :file_file_size, :integer
  end

  def down
    remove_column :languages, :file_file_name, :string
    remove_column :languages, :file_content_type, :string
    remove_column :languages, :file_file_size, :integer
  end
end
