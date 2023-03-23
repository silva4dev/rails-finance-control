class AddParperclipToBill < ActiveRecord::Migration[5.0]
  def change
    add_attachment :bills, :image
  end
end
