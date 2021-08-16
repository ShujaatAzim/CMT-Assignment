class Provider < ApplicationRecord

  default_scope { order(created_at: :desc) }
  validates :npi, uniqueness: true
  
end
