class Comment < ApplicationRecord
  include Visible
  belongs_to :post
  broadcasts_to :post  
end
