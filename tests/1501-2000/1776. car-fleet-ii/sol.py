# https://leetcode.com/problems/car-fleet-ii/description/?envType=problem-list-v2&envId=monotonic-stack
class Solution:
    def getCollisionTimes(self, cars: List[List[int]]) -> List[float]:
        nums = cars
        n = len(nums)
        """
        all the cars are moving towards the right 


        if we want to know where it the next slowest car 


        we should use monotonic stack 


        but heres the catch the monotonic stack is offline 


        what if a new collison happen after some time 



        so we should know the acccidents at the right first 


        because look at our merge step 


        when both collide the both gets merged and coverted into car with minimum speed 


        i.e simply the fastest car is disapperaing 



        """
        right_greater = [-1] * (n)
        ans = [-1] * (n)
        stack = []
        """
        what should i store in a stack 


        the future cars in increasing order of speed ???  Yes chako

        Whyy seee when the cars are in the increasinmg order of the speed


        they wont collide  hence they are the valid cars 
        


        Now when we are processing the current cars speed will not get reduced by any other cars to the left of it 

        because if they are collided the car has more speed but the final 

        move will be of the smallest speed 


        OKkk! 


        now the problem arises when the car we are trying to collide had it's speed changed due to collision with another car 




        (3,4) (5,4) (6,3) (9,1) ->0second

        (7,4) (9,4   (9,3) -> merged) (10,1) ->1second

        (9,4) (10.5,3   (10.5,1) -> merged)  ->1.5second

        (11,4) (11,1) -> at 2 second 


        notice one thing our initial lefts are 

        for speed 4 -> speed 3 

        for speed 3 -> speed 1 


        but by the time speed 4 collide 3 -> speed 3 already collides speed  1 


        so now we should check relative time between speed 4 and 1 

        (9-3)/(4-1) -> 2seconds 

        """
        for r in range(n - 1, -1, -1):
            while stack and nums[stack[-1]][1] >= nums[r][1]:
                stack.pop()
            if len(stack):
                right_greater[r] = stack[-1]
            stack.append(r)
        # print(right_greater)
        for r in range(n - 1, -1, -1):
            collide_car_id = right_greater[r]
            while (
                collide_car_id != -1
                and ans[collide_car_id] != -1
                and ans[collide_car_id]
                < (nums[collide_car_id][0] - nums[r][0])
                / (nums[r][1] - nums[collide_car_id][1])
            ):
                collide_car_id = right_greater[collide_car_id]
            if collide_car_id != -1:
                ans[r] = (nums[collide_car_id][0] - nums[r][0]) / (
                    nums[r][1] - nums[collide_car_id][1]
                )
        return ans
