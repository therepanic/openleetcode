class Solution:
    def findAllRecipes(self, recipes: List[str], ingredients: List[List[str]], supplies: List[str]) -> List[str]:
        available_supplies = set(supplies)
        
        ingredient_to_recipes = {}
        
        in_degree = {}
        
        recipe_to_ingredients = {}
        
        for i, recipe in enumerate(recipes):
            recipe_ingredients = ingredients[i]
            recipe_to_ingredients[recipe] = recipe_ingredients
            in_degree[recipe] = len(recipe_ingredients)
            
            for ingredient in recipe_ingredients:
                if ingredient not in ingredient_to_recipes:
                    ingredient_to_recipes[ingredient] = []
                ingredient_to_recipes[ingredient].append(recipe)
        
        queue = list(available_supplies)
        result = []
        
        while queue:
            current = queue.pop(0)
            
            if current in recipe_to_ingredients:
                result.append(current)
            
            if current in ingredient_to_recipes:
                for dependent_recipe in ingredient_to_recipes[current]:
                    in_degree[dependent_recipe] -= 1
                    
                    if in_degree[dependent_recipe] == 0:
                        queue.append(dependent_recipe)
        
        return result