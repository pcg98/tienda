class Size < ApplicationRecord
  belongs_to :producto

  def disable_select
    if self.stock == 0
      true
    else
      false
    end
  end
end
