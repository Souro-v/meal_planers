import 'package:get/get.dart';
import '../models/meal_model.dart';

class MealPlanController extends GetxController {
  final addedMealIds = <String>[].obs;

  void toggleMeal(String id) {
    addedMealIds.contains(id)
        ? addedMealIds.remove(id)
        : addedMealIds.add(id);
  }

  bool isAdded(String id) => addedMealIds.contains(id);

  // ══════════════════════════════════════════
  //  MOST POPULAR
  // ══════════════════════════════════════════
  static const mostPopular = [
    MealModel(
      id: 'mp1',
      name: 'Brussels Sprouts, Mashed Potato & Sausage Bowl',
      imageUrl: 'assets/images/meals/meal_brussels_sprouts_bowl.png',
      isPro: true,
      duration: '35 minutes',
      servings: 2,
      cookware: ['Large pot', 'Baking sheet', 'Large skillet', 'Mixing bowl'],
      ingredients: [
        IngredientModel(name: 'brussels sprouts', quantity: '1 lb'),
        IngredientModel(name: 'potatoes', quantity: '2 large'),
        IngredientModel(name: 'sausage links', quantity: '2 pieces'),
        IngredientModel(name: 'butter', quantity: '2 tbsp'),
        IngredientModel(name: 'olive oil', quantity: '2 tbsp'),
        IngredientModel(name: 'garlic', quantity: '3 cloves'),
        IngredientModel(name: 'salt & pepper', quantity: 'to taste'),
      ],
      instructions: [
        InstructionModel(
          step: 'Preheat oven to 400°F. Trim and halve brussels sprouts, toss with olive oil, salt, and pepper.',
          items: ['1 lb brussels sprouts', '2 tbsp olive oil', 'salt & pepper to taste'],
        ),
        InstructionModel(
          step: 'Spread brussels sprouts on a baking sheet and roast for 20–25 minutes until golden and crispy.',
          items: [],
        ),
        InstructionModel(
          step: 'Meanwhile, boil potatoes until tender. Drain and mash with butter, salt, and pepper.',
          items: ['2 large potatoes', '2 tbsp butter', 'salt & pepper to taste'],
        ),
        InstructionModel(
          step: 'Slice sausage and pan-fry in a skillet over medium heat until browned on both sides.',
          items: ['2 sausage links'],
        ),
        InstructionModel(
          step: 'Assemble bowls with mashed potato base, roasted sprouts, and sausage slices on top.',
          items: [],
        ),
      ],
    ),
    MealModel(
      id: 'mp2',
      name: 'Roasted Cauliflower & Black Bean Burrito Bowl with Cilantro',
      imageUrl: 'assets/images/meals/meal_cauliflower_burrito_bowl.png',
      duration: '30 minutes',
      servings: 2,
      cookware: ['Baking sheet', 'Medium saucepan', 'Can opener'],
      ingredients: [
        IngredientModel(name: 'cauliflower florets', quantity: '3 cups'),
        IngredientModel(name: 'black beans, canned', quantity: '1 can'),
        IngredientModel(name: 'basmati rice', quantity: '1 cup'),
        IngredientModel(name: 'cilantro', quantity: '¼ cup chopped'),
        IngredientModel(name: 'lime juice', quantity: '2 tbsp'),
        IngredientModel(name: 'cumin', quantity: '1 tsp'),
        IngredientModel(name: 'olive oil', quantity: '2 tbsp'),
      ],
      instructions: [
        InstructionModel(
          step: 'Preheat oven to 425°F. Toss cauliflower with olive oil, cumin, and salt. Roast for 25 minutes.',
          items: ['3 cups cauliflower florets', '2 tbsp olive oil', '1 tsp cumin'],
        ),
        InstructionModel(
          step: 'Cook basmati rice according to package instructions. Fluff with a fork when done.',
          items: ['1 cup basmati rice'],
        ),
        InstructionModel(
          step: 'Drain and rinse black beans. Warm in a saucepan over low heat with a pinch of cumin.',
          items: ['1 can black beans'],
        ),
        InstructionModel(
          step: 'Assemble bowls with rice base, roasted cauliflower, and black beans. Top with cilantro and lime juice.',
          items: ['¼ cup chopped cilantro', '2 tbsp lime juice'],
        ),
      ],
    ),
    MealModel(
      id: 'mp3',
      name: 'Creamy Cashew Zucchini Vegan Sausage Pasta',
      imageUrl: 'assets/images/meals/meal_cashew_zucchini_pasta.png',
      duration: '25 minutes',
      servings: 2,
      cookware: ['Large pot', 'Blender', 'Large skillet', 'Colander'],
      ingredients: [
        IngredientModel(name: 'pasta', quantity: '200g'),
        IngredientModel(name: 'zucchini', quantity: '2 medium'),
        IngredientModel(name: 'vegan sausage', quantity: '2 links'),
        IngredientModel(name: 'cashews, soaked', quantity: '½ cup'),
        IngredientModel(name: 'nutritional yeast', quantity: '2 tbsp'),
        IngredientModel(name: 'garlic', quantity: '2 cloves'),
        IngredientModel(name: 'vegetable broth', quantity: '½ cup'),
      ],
      instructions: [
        InstructionModel(
          step: 'Cook pasta according to package directions. Reserve ½ cup pasta water before draining.',
          items: ['200g pasta'],
        ),
        InstructionModel(
          step: 'Blend soaked cashews with garlic, nutritional yeast, and vegetable broth until completely smooth.',
          items: ['½ cup soaked cashews', '2 cloves garlic', '2 tbsp nutritional yeast', '½ cup vegetable broth'],
        ),
        InstructionModel(
          step: 'Slice zucchini and vegan sausage. Sauté in skillet over medium-high heat for 5–7 minutes until golden.',
          items: ['2 medium zucchini', '2 vegan sausage links'],
        ),
        InstructionModel(
          step: 'Add cashew cream to skillet, stir in pasta and reserved pasta water. Toss until well coated and serve immediately.',
          items: [],
        ),
      ],
    ),
  ];

  // ══════════════════════════════════════════
  //  RECENTLY CREATED
  // ══════════════════════════════════════════
  static const recentlyCreated = [
    MealModel(
      id: 'rc1',
      name: 'Indian Butter Chicken with Basmati Rice (Chicken Makhani)',
      imageUrl: 'assets/images/meals/meal_butter_chicken.png',
      duration: '40 minutes',
      servings: 4,
      cookware: ['Large skillet', 'Medium saucepan', 'Blender', 'Can opener'],
      ingredients: [
        IngredientModel(name: 'basmati rice', quantity: '½ cup'),
        IngredientModel(name: 'chicken or vegetable broth', quantity: '16 fl oz'),
        IngredientModel(name: 'cilantro', quantity: '½ small bunch'),
        IngredientModel(name: 'coconut milk', quantity: '½ (13.5 fl oz) can'),
        IngredientModel(name: 'garlic', quantity: '1 (1 inch) piece'),
        IngredientModel(name: 'ginger root', quantity: '16 fl oz'),
        IngredientModel(name: 'grape tomatoes', quantity: '½ pint'),
        IngredientModel(name: 'jalapeño pepper', quantity: '1'),
        IngredientModel(name: 'yellow onion', quantity: '1 medium'),
        IngredientModel(name: 'garam masala', quantity: '2 tsp'),
        IngredientModel(name: 'butter', quantity: '2 tbsp'),
      ],
      instructions: [
        InstructionModel(
          step: 'Using a strainer or colander, rinse the rice under cold running water, then drain and transfer to a small saucepan. Add broth and bring the mixture to a boil over high heat.',
          items: ['½ cup basmati rice', '8 fl oz (1 cup) chicken or vegetable broth'],
        ),
        InstructionModel(
          step: 'Meanwhile, wash and dry the fresh produce.',
          items: ['1 (1 inch) piece ginger root', '1 jalapeño pepper', '½ small bunch cilantro', '½ pint grape tomatoes'],
        ),
        InstructionModel(
          step: 'Once the liquid comes to a boil, stir the mixture, cover the saucepan, and reduce heat to low. Cook rice until liquid is fully absorbed, 15–18 minutes. Once done, remove from heat and let it stand.',
          items: [],
        ),
        InstructionModel(
          step: 'Sauté diced onion, garlic, and ginger in butter until golden. Add tomatoes, jalapeño, and garam masala. Cook for 5 minutes then blend smooth.',
          items: ['1 medium yellow onion', '1 inch garlic', '2 tbsp butter', '2 tsp garam masala'],
        ),
        InstructionModel(
          step: 'Return blended sauce to pan. Stir in coconut milk and simmer for 10 minutes. Serve over rice and garnish with fresh cilantro.',
          items: ['½ can coconut milk', '½ small bunch cilantro'],
        ),
      ],
    ),
    MealModel(
      id: 'rc2',
      name: 'Greek Salad with Feta Cheese & Kalamata Olives',
      imageUrl: 'assets/images/meals/meal_greek_salad.png',
      isPro: true,
      duration: '15 minutes',
      servings: 2,
      cookware: ['Large salad bowl', 'Small mixing bowl', 'Sharp knife'],
      ingredients: [
        IngredientModel(name: 'romaine lettuce', quantity: '1 head'),
        IngredientModel(name: 'cucumber', quantity: '1 large'),
        IngredientModel(name: 'cherry tomatoes', quantity: '1 cup'),
        IngredientModel(name: 'feta cheese', quantity: '100g'),
        IngredientModel(name: 'kalamata olives', quantity: '½ cup'),
        IngredientModel(name: 'red onion', quantity: '¼ medium'),
        IngredientModel(name: 'olive oil', quantity: '3 tbsp'),
        IngredientModel(name: 'lemon juice', quantity: '2 tbsp'),
        IngredientModel(name: 'dried oregano', quantity: '1 tsp'),
      ],
      instructions: [
        InstructionModel(
          step: 'Wash and chop romaine lettuce into bite-sized pieces. Place in a large salad bowl.',
          items: ['1 head romaine lettuce'],
        ),
        InstructionModel(
          step: 'Dice cucumber, halve cherry tomatoes, and thinly slice red onion. Add all to the bowl.',
          items: ['1 large cucumber', '1 cup cherry tomatoes', '¼ medium red onion'],
        ),
        InstructionModel(
          step: 'Add kalamata olives to the bowl.',
          items: ['½ cup kalamata olives'],
        ),
        InstructionModel(
          step: 'Whisk together olive oil, lemon juice, and oregano to make the dressing. Pour over salad and toss gently.',
          items: ['3 tbsp olive oil', '2 tbsp lemon juice', '1 tsp dried oregano'],
        ),
        InstructionModel(
          step: 'Crumble feta cheese generously on top and serve immediately.',
          items: ['100g feta cheese'],
        ),
      ],
    ),
    MealModel(
      id: 'rc3',
      name: 'Italian Pasta Tomato & Basil (Pomodoro)',
      imageUrl: 'assets/images/meals/meal_italian_pasta.png',
      duration: '20 minutes',
      servings: 2,
      cookware: ['Large pot', 'Large skillet', 'Colander', 'Wooden spoon'],
      ingredients: [
        IngredientModel(name: 'spaghetti', quantity: '200g'),
        IngredientModel(name: 'canned crushed tomatoes', quantity: '1 can'),
        IngredientModel(name: 'fresh basil leaves', quantity: '¼ cup'),
        IngredientModel(name: 'garlic', quantity: '3 cloves'),
        IngredientModel(name: 'olive oil', quantity: '3 tbsp'),
        IngredientModel(name: 'parmesan cheese', quantity: '¼ cup grated'),
        IngredientModel(name: 'red pepper flakes', quantity: '½ tsp'),
      ],
      instructions: [
        InstructionModel(
          step: 'Boil a large pot of salted water. Cook spaghetti until al dente per package instructions.',
          items: ['200g spaghetti'],
        ),
        InstructionModel(
          step: 'In a skillet, sauté sliced garlic in olive oil over medium heat until golden. Add red pepper flakes.',
          items: ['3 cloves garlic', '3 tbsp olive oil', '½ tsp red pepper flakes'],
        ),
        InstructionModel(
          step: 'Pour in crushed tomatoes and simmer for 10 minutes. Season with salt to taste.',
          items: ['1 can crushed tomatoes'],
        ),
        InstructionModel(
          step: 'Drain pasta, reserving ¼ cup pasta water. Add pasta to sauce and toss. Add pasta water as needed.',
          items: [],
        ),
        InstructionModel(
          step: 'Stir in fresh basil. Plate and top with grated parmesan cheese.',
          items: ['¼ cup fresh basil leaves', '¼ cup grated parmesan cheese'],
        ),
      ],
    ),
  ];

  // ══════════════════════════════════════════
  //  RECOMMENDED PLAN
  // ══════════════════════════════════════════
  static const recommendedPlan = [
    MealModel(
      id: 'rp1',
      name: 'Avocado Toast with Poached Eggs',
      imageUrl: 'assets/images/meals/meal_recommended_1.png',
      duration: '15 minutes',
      servings: 2,
      cookware: ['Small saucepan', 'Toaster', 'Slotted spoon'],
      ingredients: [
        IngredientModel(name: 'sourdough bread', quantity: '4 slices'),
        IngredientModel(name: 'ripe avocados', quantity: '2'),
        IngredientModel(name: 'eggs', quantity: '4 large'),
        IngredientModel(name: 'lemon juice', quantity: '1 tbsp'),
        IngredientModel(name: 'red chili flakes', quantity: '½ tsp'),
        IngredientModel(name: 'salt & pepper', quantity: 'to taste'),
      ],
      instructions: [
        InstructionModel(
          step: 'Toast sourdough bread slices until golden and crispy on both sides.',
          items: ['4 slices sourdough bread'],
        ),
        InstructionModel(
          step: 'Mash avocados with lemon juice, salt, and pepper until smooth but slightly chunky.',
          items: ['2 ripe avocados', '1 tbsp lemon juice', 'salt & pepper to taste'],
        ),
        InstructionModel(
          step: 'Bring a saucepan of water to a gentle simmer. Poach eggs for 3–4 minutes until whites are set.',
          items: ['4 large eggs'],
        ),
        InstructionModel(
          step: 'Spread avocado mash generously on toast. Top each with a poached egg and sprinkle chili flakes.',
          items: ['½ tsp red chili flakes'],
        ),
      ],
    ),
    MealModel(
      id: 'rp2',
      name: 'Teriyaki Salmon with Steamed Broccoli',
      imageUrl: 'assets/images/meals/meal_recommended_2.png',
      duration: '25 minutes',
      servings: 2,
      cookware: ['Medium skillet', 'Steamer basket', 'Small saucepan'],
      ingredients: [
        IngredientModel(name: 'salmon fillets', quantity: '2 (6 oz each)'),
        IngredientModel(name: 'broccoli florets', quantity: '2 cups'),
        IngredientModel(name: 'soy sauce', quantity: '3 tbsp'),
        IngredientModel(name: 'honey', quantity: '2 tbsp'),
        IngredientModel(name: 'sesame oil', quantity: '1 tsp'),
        IngredientModel(name: 'garlic', quantity: '2 cloves'),
        IngredientModel(name: 'sesame seeds', quantity: '1 tbsp'),
        IngredientModel(name: 'jasmine rice', quantity: '1 cup'),
      ],
      instructions: [
        InstructionModel(
          step: 'Cook jasmine rice according to package instructions. Keep warm until ready to serve.',
          items: ['1 cup jasmine rice'],
        ),
        InstructionModel(
          step: 'Mix soy sauce, honey, sesame oil, and minced garlic together to make teriyaki sauce.',
          items: ['3 tbsp soy sauce', '2 tbsp honey', '1 tsp sesame oil', '2 cloves garlic'],
        ),
        InstructionModel(
          step: 'Steam broccoli florets for 5–6 minutes until tender-crisp. Season lightly with salt.',
          items: ['2 cups broccoli florets'],
        ),
        InstructionModel(
          step: 'Sear salmon in a hot skillet for 3–4 minutes per side. Brush teriyaki sauce in the last 2 minutes.',
          items: ['2 salmon fillets (6 oz each)'],
        ),
        InstructionModel(
          step: 'Serve salmon over rice with steamed broccoli. Sprinkle sesame seeds on top.',
          items: ['1 tbsp sesame seeds'],
        ),
      ],
    ),
    MealModel(
      id: 'rp3',
      name: 'Vegetable Stir Fry with Tofu & Brown Rice',
      imageUrl: 'assets/images/meals/meal_recommended_3.png',
      duration: '30 minutes',
      servings: 2,
      cookware: ['Large wok or skillet', 'Medium saucepan', 'Paper towels'],
      ingredients: [
        IngredientModel(name: 'firm tofu', quantity: '200g'),
        IngredientModel(name: 'brown rice', quantity: '1 cup'),
        IngredientModel(name: 'mixed bell peppers', quantity: '2'),
        IngredientModel(name: 'snap peas', quantity: '1 cup'),
        IngredientModel(name: 'carrots', quantity: '2 medium'),
        IngredientModel(name: 'soy sauce', quantity: '2 tbsp'),
        IngredientModel(name: 'ginger root', quantity: '1 inch piece'),
        IngredientModel(name: 'sesame oil', quantity: '1 tbsp'),
      ],
      instructions: [
        InstructionModel(
          step: 'Cook brown rice according to package directions, about 25 minutes. Keep warm.',
          items: ['1 cup brown rice'],
        ),
        InstructionModel(
          step: 'Press tofu dry with paper towels and cut into 1-inch cubes. Pan-fry in sesame oil until golden on all sides.',
          items: ['200g firm tofu', '1 tbsp sesame oil'],
        ),
        InstructionModel(
          step: 'Slice bell peppers and carrots into thin strips.',
          items: ['2 mixed bell peppers', '2 medium carrots'],
        ),
        InstructionModel(
          step: 'Stir-fry vegetables and snap peas in the same wok on high heat for 5–6 minutes until slightly charred.',
          items: ['1 cup snap peas'],
        ),
        InstructionModel(
          step: 'Add tofu back in. Pour soy sauce and grated ginger over everything. Toss well and serve over brown rice.',
          items: ['2 tbsp soy sauce', '1 inch piece ginger root'],
        ),
      ],
    ),
  ];
}