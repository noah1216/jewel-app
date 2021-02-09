class AddressSeller < ApplicationRecord
  belongs_to :seller, optional: true
  include Addressable
end
