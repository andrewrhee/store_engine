class Product < ActiveRecord::Base
  attr_accessible :body, :title

  def to_s
    title
  end
end
