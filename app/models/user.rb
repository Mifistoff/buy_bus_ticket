class User < ApplicationRecord
  has_many :orders

  def string_role
    if role == 1
      'Адміністратор'
    else
      'Покупець'
    end
  end
end
