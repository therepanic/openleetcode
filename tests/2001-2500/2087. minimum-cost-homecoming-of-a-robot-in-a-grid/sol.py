class Solution:
    def minCost(self, startPos: List[int], homePos: List[int], rowCosts: List[int], colCosts: List[int]) -> int:

    #===========================================================================================================================
        # Look at the constraint. It says 10^5 for a single value of n. 
        #  N * m will be 10^10, right? 
        # Immediately, the answer is just some greedy approach, not some  traversal and some Djikstra and all. 
    # #===========================================================================================================================
        sr,sc = startPos    
        er,ec = homePos     #Destination coordinate end Row End Column 


        rowtot  = 0 
        if sr<er:
            rowtot = sum( rowCosts[sr+1:er+1] )
        if sr>er:
            rowtot = sum( rowCosts[er: sr])


        coltot  = 0 
        if sc<ec:
            coltot = sum( colCosts[sc+1:ec+1] )
        if sc>ec:
            coltot = sum( colCosts[ec: sc])


        return rowtot + coltot
    #===========================================================================================================================
    
    



    

    # Djikstra on a 2D grid.
    ## dijkstras and explore full array
    #  Djikstra always uses a heap and a dist matrix initialized with infinity startlingly. 
    #===========================================================================================================================
        n = len(rowCosts)
        m = len(colCosts)

        sr,sc = startPos
        er,ec = homePos


        dist = [[10**14]*m for _ in range(n)]

        pq = [(0,sr,sc)] #(dist, r,c)
        dist[sr][sc]= 0 

        direct = [[-1,0], [0,1], [1,0], [0,-1]]

        while pq:
            d, r, c = heapq.heappop(pq)       
            

            if d > dist[r][c]: continue #Standard Djikstra optimization. 


            if r == er and c == ec:   #reached destination coordinate  #ANSWER TIME
                return d

            
            for dr , dc in direct:
                nr, nc = r+dr, c+dc            

                if 0<=nr<n and 0<=nc<m:         #validty check ALWAYS


                    #--------------------------------------------------
                    newEffort= 0 
                    if nr!=r:    #(nr!= r) means that we have traveled in the vertical direction. up-down
                        newEffort = d+ rowCosts[nr]
                    if nc!=c:    #(nc!= c) that means we have traveled in the horizontal direction, left-right. 
                        newEffort = d+ colCosts[nc]
                    
                    #Only any one of the above conditions will work. 
                    #As the next will be one right or left move, or maybe one up or down move 
                    #------------------------------------------------------


                                  
                    if newEffort < dist[nr][nc]: 
                        dist[nr][nc] = newEffort        #updated🇦🇱 inthe dist matrix
                        heapq.heappush(pq,(newEffort, nr, nc))  


        return dist[er][ec]

        #This Djikstra approach will TLE.
        #  Time Complexity : O(nm log(nm))
        #  Time Complexity : O(nm ) #  nm ===>>10^10
    #===========================================================================================================================