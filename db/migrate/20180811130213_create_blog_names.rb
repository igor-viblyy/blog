class CreateBlogNames < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
