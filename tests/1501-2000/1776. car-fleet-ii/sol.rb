# @param {Integer[][]} cars
# @return {Float[]}
def get_collision_times(cars)
    n = cars.length
    right_greater = Array.new(n, -1)
    ans = Array.new(n, -1.0)
    stack = []
    (n - 1).downto(0) do |r|
        while !stack.empty? && cars[stack[-1]][1] >= cars[r][1]
            stack.pop
        end
        if !stack.empty?
            right_greater[r] = stack[-1]
        end
        stack.push(r)
    end
    (n - 1).downto(0) do |r|
        collide_id = right_greater[r]
        while collide_id != -1 && ans[collide_id] != -1 && ans[collide_id] < (cars[collide_id][0] - cars[r][0]).to_f / (cars[r][1] - cars[collide_id][1])
            collide_id = right_greater[collide_id]
        end
        if collide_id != -1
            ans[r] = (cars[collide_id][0] - cars[r][0]).to_f / (cars[r][1] - cars[collide_id][1])
        end
    end
    ans
end
