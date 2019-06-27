class Board

    attr_accessor :grid

    def initialize
        @grid = Array.new(3) { Array.new(3) }
    end   

    def [](position)
        i, j = position
        @grid[i][j]
    end

    def []=(position,value)
        i, j = position
        @grid[i][j] = value
    end

    def empty?(pos)
        self[pos].nil?
    end 

    def place_mark(pos, mark)
        if empty?(pos)
            self[pos]= mark
            return true 
        else
            puts "Invalid Move!"
            return false 
        end
    end    

    def winner
        # check row 
        @grid.each do |ele| 
            if ele.uniq.compact.length == 1 && ele.compact.length == 3
                return ele.first 
            end 
        end    
        #check colum 
        @grid.transpose.each do |ele| 
            if ele.uniq.compact.length == 1 && ele.compact.length == 3
                return ele.first
            end
        end    
        #check_diag
        diag1 = [self[[0,0]], self[[1,1]], self[[2,2]]]
        diag2 = [self[[2,0]], self[[1,1]], self[[0,2]]]
        arr = [diag1, diag2]
        arr.each do |ele|
            if ele.uniq.compact.length == 1 && ele.compact.length == 3
                return ele.first
            end 
        end
        return nil
    end    

    def print
        @grid.each_with_index do |row,i| 
            new_row = row.map {|el| el.nil? ? ' ' : el }
            puts ' ' + new_row.join(' | ') + ' '
            puts "-"*11 if i < 2
        end
    end

end 