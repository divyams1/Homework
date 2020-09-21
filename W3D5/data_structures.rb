class Stack
    def initialize
        @stack = []
    end 

    def push(el)
        @stack << el 
    end

    def pop 
        @stack.pop
    end 

    def peek 
        @stack[-1]
    end

end

class Queue 
    def initialize 
        @queue = []
    end 

    def enqueue(el)
        @queue << el
    end

    def dequeue
        @queue.shift 
    end

    def peek 
        @queue.last
    end
end

class Map 
    def initialize
        @map = []
    end

    def set(key, value)
        @map << [key,value]
    end

    def get(key)
        @map.each do |ele| 
            if ele[0] == key 
                return ele[1]
            end 
        end 
        return false
    end

    def delete(key)
        @map.each_with_index do |ele,ind| 
            if ele[0] == key 
                @map.delete(ind)
            end 
        end 
        return false
    end

end