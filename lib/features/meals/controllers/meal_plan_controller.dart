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
        'Preheat oven to 400°F. Trim and halve brussels sprouts, toss with olive oil, salt, and pepper.',
        'Spread brussels sprouts on a baking sheet and roast for 20–25 minutes until golden and crispy.',
        'Meanwhile, boil potatoes until tender. Drain and mash with butter, salt, and pepper.',
        'Slice sausage and pan-fry in a skillet over medium heat until browned on both sides.',
        'Assemble bowls with mashed potato base, roasted sprouts, and sausage slices on top.',
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
        'Preheat oven to 425°F. Toss cauliflower with olive oil, cumin, salt, and roast for 25 minutes.',
        'Cook basmati rice according to package instructions. Fluff with a fork.',
        'Drain and rinse black beans. Warm in a saucepan over low heat with a pinch of cumin.',
        'Assemble bowls: rice base, roasted cauliflower, black beans. Top with cilantro and lime juice.',
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
        'Cook pasta according to package directions. Reserve ½ cup pasta water before draining.',
        'Blend soaked cashews with garlic, nutritional yeast, and vegetable broth until smooth.',
        'Slice zucchini and vegan sausage. Sauté in skillet over medium-high heat for 5–7 minutes.',
        'Add cashew cream to the skillet, stir in pasta and pasta water. Toss until well coated.',
        'Season with salt, pepper, and serve immediately.',
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
        IngredientModel(name: 'cinnamon, ground', quantity: '1 tsp'),
        IngredientModel(name: 'garam masala', quantity: '2 tsp'),
        IngredientModel(name: 'butter', quantity: '2 tbsp'),
      ],
      instructions: [
        'Cook basmati rice with broth in a saucepan over medium heat for 18–20 minutes.',
        'Sauté diced onion, garlic, and ginger in butter until golden and fragrant.',
        'Add grape tomatoes, jalapeño, garam masala, and cinnamon. Cook for 5 minutes.',
        'Blend the tomato mixture until smooth. Return to pan and stir in coconut milk.',
        'Add chicken and simmer in the sauce for 15 minutes until cooked through.',
        'Serve over basmati rice and garnish generously with fresh cilantro.',
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
        'Chop romaine lettuce and place in a large salad bowl.',
        'Dice cucumber and halve the cherry tomatoes. Thinly slice red onion.',
        'Add vegetables to the bowl along with kalamata olives.',
        'Whisk together olive oil, lemon juice, and oregano for the dressing.',
        'Pour dressing over salad and toss gently. Top with crumbled feta cheese.',
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
        IngredientModel(name: 'salt', quantity: 'to taste'),
      ],
      instructions: [
        'Boil a large pot of salted water and cook spaghetti until al dente.',
        'In a skillet, sauté sliced garlic in olive oil until golden. Add red pepper flakes.',
        'Pour in crushed tomatoes and simmer for 10 minutes. Season with salt.',
        'Drain pasta, reserving ¼ cup pasta water. Add pasta to the sauce.',
        'Toss everything together, adding pasta water as needed. Stir in fresh basil.',
        'Plate and top with grated parmesan cheese.',
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
        'Toast sourdough bread until golden and crisp.',
        'Mash avocados with lemon juice, salt, and pepper in a bowl.',
        'Poach eggs in simmering water for 3–4 minutes until whites are set.',
        'Spread avocado mash on toast. Top each with a poached egg.',
        'Season with salt, pepper, and chili flakes. Serve immediately.',
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
        'Cook jasmine rice according to package instructions.',
        'Mix soy sauce, honey, sesame oil, and minced garlic for teriyaki sauce.',
        'Steam broccoli florets for 5–6 minutes until tender-crisp.',
        'Sear salmon fillets in a hot skillet for 3–4 minutes per side.',
        'Brush teriyaki sauce over salmon in the last 2 minutes of cooking.',
        'Serve salmon over rice with steamed broccoli. Sprinkle sesame seeds on top.',
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
        'Cook brown rice according to package directions (about 25 minutes).',
        'Press tofu dry with paper towels and cut into cubes. Pan-fry until golden on all sides.',
        'Slice bell peppers and carrots into thin strips.',
        'Stir-fry vegetables in sesame oil on high heat for 5–6 minutes.',
        'Add tofu back in. Pour soy sauce and grated ginger over everything. Toss well.',
        'Serve over brown rice immediately.',
      ],
    ),
  ];
}