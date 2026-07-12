# @param {Integer[][]} bookings
# @param {Integer} n
# @return {Integer[]}
def corp_flight_bookings(bookings, n)
    l = Array.new(n + 1, 0)
    bookings.each do |i|
        x = i[0]
        y = i[1]
        l[x - 1] += i[-1]
        l[y] -= i[-1]
    end
    
    s = []
    (0...l.length - 1).each do |i|
        if i == 0
            s << l[i]
        else
            s << s[-1] + l[i]
        end
    end
    s
end
