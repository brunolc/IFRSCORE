class Admin < ActiveRecord::Base

validates :username,presence: true

validates :email,presence: true

validates :senha,presence: true

validates :email,uniqueness: true

validates :username,uniqueness: true

end



