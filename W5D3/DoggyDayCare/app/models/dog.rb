class Dog < ApplicationRecord 


    validate :check_name_length
    validates :name, presence: true 

    def check_name_length 
        unless self.name.length >= 4 
            errors[:name] << "Name is too short"
        end 
    end 

    # def toys
    #     Toy.where({ dog_id: self.id })
    # end 
    has_many(:toys, {
        primary_key: :id, 
        foreign_key: :dog_id,
        class_name: :Toy
    })

    belongs to :house
        primary_key: :id, 
        foreign_key: dog_id, 
        class_name: :House 
        
end 