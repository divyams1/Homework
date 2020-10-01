class Toy < ApplicationRecord 

belongs_to(:dog, {
    primary_key: :id, 
    foreign_key: :dog_id 
    class_name: :Dog
})


has_one(:house, {
    through: :dog , 
    source: :house
})
end