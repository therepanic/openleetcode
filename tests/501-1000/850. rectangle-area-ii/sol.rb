# @param {Integer[][]} rectangles
# @return {Integer}
def rectangle_area(rectangles)
    open = 0
    close = 1
    events = []
    rectangles.each do |x1, y1, x2, y2|
        events << [y1, open, x1, x2]
        events << [y2, close, x1, x2]
    end
    events.sort!
    
    res = 0
    cur_y = events[0][0]
    active = []
    
    events.each do |y, typ, x1, x2|
        q = 0
        cur = -1
        active.sort.each do |ax1, ax2|
            q += [0, ax2 - [cur, ax1].max].max
            cur = [cur, ax2].max
        end
        
        res += q * (y - cur_y)
        cur_y = y
        
        if typ == open
            active << [x1, x2]
        else
            index = active.index([x1, x2])
            active.delete_at(index) if index
        end
    end
    
    res % (10**9 + 7)
end
