
  class Delivery < ActiveHash::Base 

    self.data = [
         { id: 0, delivery: '---' },
         { id: 1, delivery: '着払い(購入者負担)' },
         { id: 2, delivery: '送料込み(出品者負担)' },
         ]
       include ActiveHash::Associations
       has_many :items
     
end
