class Cat < Activerecord::Base

  def to_s
    "Cat number #{self.id} with a name of #{self.name}"
  end

end
