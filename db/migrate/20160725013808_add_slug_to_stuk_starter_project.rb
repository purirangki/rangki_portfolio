class AddSlugToStukStarterProject < ActiveRecord::Migration
  def change
    add_column :stuk_starter_projects, :slug, :string
  end
end
