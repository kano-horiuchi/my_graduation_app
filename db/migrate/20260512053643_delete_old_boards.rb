class DeleteOldBoards < ActiveRecord::Migration[7.2]
  def up
    Board.destroy_all
  end

  def down
  end
end
