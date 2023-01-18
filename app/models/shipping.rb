class Shipping < ActiveHash::Base
self.data = [
  { id: 0, shipping: '---' },
  { id: 1, shipping: '1~2日で発送' },
  { id: 2, shipping: '2~3日で発送' },
  { id: 3, shipping: '4~7日で発送' }
]
include ActiveHash::Associations
has_many :items
end