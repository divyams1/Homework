arr =['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
def sluggish(array)
    proc = Proc.new { |a,b| a<=> b }

    sorted = false 
    while !sorted 
        sorted = true 
        (0...array.length-1).each do |ind| 
            if proc.call(array[ind].length, array[ind+1].length) == 1 
                array[ind] , array[ind+1] = array[ind+1], array[ind]
                sorted = false 
            end 
        end 
    end 
    return array.pop

end

# def dominant(array)
#     proc = Proc.new { |a,b| a<=> b }
#     return self if array.length <= 1
#     pivot = array.first 
#     left = array[1..-1].select { |ele| proc.call(pivot.length, ele.length) == 1  }
#     right = array[1..-1].select { |ele| proc.call(pivot.length, ele.length) != 1  }
#     sorted = dominant(left) + [pivot] + dominant(right)
#     sorted.last

# end


def clever(array)
    max = ""
    array.each do |ele| 
        if ele.length > max.length
            max = ele 
        end 
    end
    max

end 
puts sluggish(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])
puts clever(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])
# puts dominant(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, array)
    index = 0 
    (0...array.length).each do |ind| 
        if array[ind] == direction 
            return ind 
        end 
    end 
    ind 


end


def fast_dance(direction, array)
    hash = {} 
    array.each_with_index do |ele, ind|
        hash[ele] = ind 
    end 
    return hash[direction]
end

puts slow_dance("up",  tiles_array)
puts slow_dance("right-down", tiles_array)
puts fast_dance("up",  tiles_array)
puts fast_dance("right-down", tiles_array)