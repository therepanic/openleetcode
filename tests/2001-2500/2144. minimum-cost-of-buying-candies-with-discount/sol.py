class Solution:
    def minimumCost(self, cost: List[int]) -> int:
        total_cost = 0
        cost.sort(reverse=True)

        l = len(cost)

        num_three = l // 3
        mod_three = l % 3

        pos = 0
        for i in range(0, num_three):
            first_candy = cost[pos]
            total_cost = total_cost + first_candy
            pos+=1
            second_candy = cost[pos]
            total_cost = total_cost + second_candy 
            pos+=2
            # third candy is free

        for i in range(0, mod_three):
            candy = cost[pos]
            total_cost = total_cost + candy
            pos+=1

        return total_cost