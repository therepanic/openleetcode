class Solution:
    def wateringPlants(self, plants: List[int], capacity: int) -> int:
        res=0
        c=capacity
        for i in range(len(plants)):
            steps=0
            if plants[i]<=capacity:
                steps=1
                capacity-=plants[i]
            elif plants[i]>capacity:
                capacity=c-plants[i]
                steps+=(2*i)+1
            res+=steps
        return res