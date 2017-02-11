class Invitation < ApplicationRecord
  belongs_to :driver, class_name: :User
  belongs_to :new_driver, class_name: :User, optional: true
end
