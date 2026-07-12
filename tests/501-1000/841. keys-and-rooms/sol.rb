# @param {Integer[][]} rooms
# @return {Boolean}
def can_visit_all_rooms(rooms)
    n = rooms.length
    keys = [0]
    visited = {0 => true}
    while !keys.empty?
        room = keys.pop
        rooms[room].each do |i|
            unless visited[i]
                visited[i] = true
                keys.push(i)
            end
        end
    end
    visited.length == n
end
