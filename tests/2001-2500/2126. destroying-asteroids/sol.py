class Solution:
    def asteroidsDestroyed(self, mass: int, asteroids: List[int]) -> bool:
        xmax=max(asteroids)
        freq=[0]*(1+xmax)
        for x in asteroids:
            freq[x]+=1
        planet=mass
        for x, f in enumerate(freq):
            if f==0:
                continue
            if x>planet:
                return False
            planet+=x*f
        return True