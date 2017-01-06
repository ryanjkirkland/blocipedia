class Amount < ActiveRecord::Base
  after_initialize :init

  def init
    self.value = 15_00
  end
end
