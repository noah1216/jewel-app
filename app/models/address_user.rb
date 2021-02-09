class AddressUser < ApplicationRecord
  belongs_to :user, optional: true
  include Addressable
end
