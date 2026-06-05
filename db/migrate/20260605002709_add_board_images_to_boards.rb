class AddBoardImagesToBoards < ActiveRecord::Migration[7.2]
  def change
    add_column :boards, :board_images, :jsonb, default: []
  end
end
