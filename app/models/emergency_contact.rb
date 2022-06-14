class EmergencyContact < ApplicationRecord
  belongs_to :student
  validates :name, :relationship, :contact_address, :telephone, presence: true
end


# 下書き用のカラムを作る。
# 下書きだったら、下書きじゃなかったら。で分ける。
#
# class Order < ApplicationRecord
#   validates :card_number, presence: true, if: :paid_with_card?
#
#   def paid_with_card?
#     payment_type == "card"
#   end
# end
#
# dorahutokaramu
# sitagakinotokiha
# true
#
