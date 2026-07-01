import 'package:get/get.dart';
import '../models/meal_model.dart';

class MealPlanController extends GetxController {
  final addedMealIds = <String>[].obs;

  void toggleMeal(String id) {
    addedMealIds.contains(id) ? addedMealIds.remove(id) : addedMealIds.add(id);
  }

  bool isAdded(String id) => addedMealIds.contains(id);

  // ══════════════════════════════════════════
  //  MOST POPULAR
  // ══════════════════════════════════════════
  static const mostPopular = [
    MealModel(
      id: 'mp1',
      name: 'Brussels Sprouts, Mashed Potato & Sausage Bowl',
      imageUrl: 'https://res.cloudinary.com/dehjub5m1/image/upload/meal_plannner/meal_brussels_sprouts_bowl.png',
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
          step:
              'Preheat oven to 400°F. Trim and halve brussels sprouts, toss with olive oil, salt, and pepper.',
          items: [
            '1 lb brussels sprouts',
            '2 tbsp olive oil',
            'salt & pepper to taste',
          ],
        ),
        InstructionModel(
          step:
              'Spread brussels sprouts on a baking sheet and roast for 20–25 minutes until golden and crispy.',
          items: [],
        ),
        InstructionModel(
          step:
              'Meanwhile, boil potatoes until tender. Drain and mash with butter, salt, and pepper.',
          items: [
            '2 large potatoes',
            '2 tbsp butter',
            'salt & pepper to taste',
          ],
        ),
        InstructionModel(
          step:
              'Slice sausage and pan-fry in a skillet over medium heat until browned on both sides.',
          items: ['2 sausage links'],
        ),
        InstructionModel(
          step:
              'Assemble bowls with mashed potato base, roasted sprouts, and sausage slices on top.',
          items: [],
        ),
      ],
      nutrition: NutritionModel(
        calories: 520,
        protein: '24g',
        carbs: '52g',
        fat: '22g',
        fiber: '8g',
        sugar: '6g',
        sodium: '890mg',
      ),
    ),
    MealModel(
      id: 'mp2',
      name: 'Roasted Cauliflower & Black Bean Burrito Bowl with Cilantro',
      imageUrl: 'https://res.cloudinary.com/dehjub5m1/image/upload/meal_plannner/meal_cauliflower_burrito_bowl.png',
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
          step:
              'Preheat oven to 425°F. Toss cauliflower with olive oil, cumin, and salt. Roast for 25 minutes.',
          items: [
            '3 cups cauliflower florets',
            '2 tbsp olive oil',
            '1 tsp cumin',
          ],
        ),
        InstructionModel(
          step:
              'Cook basmati rice according to package instructions. Fluff with a fork when done.',
          items: ['1 cup basmati rice'],
        ),
        InstructionModel(
          step:
              'Drain and rinse black beans. Warm in a saucepan over low heat with a pinch of cumin.',
          items: ['1 can black beans'],
        ),
        InstructionModel(
          step:
              'Assemble bowls with rice base, roasted cauliflower, and black beans. Top with cilantro and lime juice.',
          items: ['¼ cup chopped cilantro', '2 tbsp lime juice'],
        ),
      ],
      nutrition: NutritionModel(
        calories: 480,
        protein: '18g',
        carbs: '68g',
        fat: '14g',
        fiber: '12g',
        sugar: '8g',
        sodium: '720mg',
      ),
    ),
    MealModel(
      id: 'mp3',
      name: 'Creamy Cashew Zucchini Vegan Sausage Pasta',
      imageUrl: 'https://res.cloudinary.com/dehjub5m1/image/upload/meal_plannner/meal_cashew_zucchini_pasta.png',
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
          step:
              'Cook pasta according to package directions. Reserve ½ cup pasta water before draining.',
          items: ['200g pasta'],
        ),
        InstructionModel(
          step:
              'Blend soaked cashews with garlic, nutritional yeast, and vegetable broth until completely smooth.',
          items: [
            '½ cup soaked cashews',
            '2 cloves garlic',
            '2 tbsp nutritional yeast',
            '½ cup vegetable broth',
          ],
        ),
        InstructionModel(
          step:
              'Slice zucchini and vegan sausage. Sauté in skillet over medium-high heat for 5–7 minutes until golden.',
          items: ['2 medium zucchini', '2 vegan sausage links'],
        ),
        InstructionModel(
          step:
              'Add cashew cream to skillet, stir in pasta and reserved pasta water. Toss until well coated and serve immediately.',
          items: [],
        ),
      ],
      nutrition: NutritionModel(
        calories: 560,
        protein: '22g',
        carbs: '62g',
        fat: '24g',
        fiber: '6g',
        sugar: '8g',
        sodium: '680mg',
      ),
    ),
  ];

  // vegetarian section added

  static const vegetarianMeals = [
    MealModel(
      id: 'veg1',
      name: 'Paneer Tikka',
      imageUrl:
          'https://res.cloudinary.com/dehjub5m1/image/upload/meal_plannner/meal_paneer_tikka.jpeg',
      duration: '35 minutes',
      servings: 4,
      cookware: ['Grill pan or tandoor', 'Mixing bowl', 'Skewers'],
      ingredients: [
        IngredientModel(name: 'paneer', quantity: '400g, cubed'),
        IngredientModel(name: 'bell peppers', quantity: '2, cubed'),
        IngredientModel(name: 'red onion', quantity: '1, cubed'),
        IngredientModel(name: 'yogurt', quantity: '½ cup'),
        IngredientModel(name: 'ginger garlic paste', quantity: '1 tbsp'),
        IngredientModel(name: 'tandoori masala', quantity: '2 tbsp'),
        IngredientModel(name: 'lemon juice', quantity: '1 tbsp'),
      ],
      instructions: [
        InstructionModel(
          step:
              'Mix yogurt, ginger garlic paste, tandoori masala, and lemon juice in a bowl to make the marinade.',
          items: [
            '½ cup yogurt',
            '1 tbsp ginger garlic paste',
            '2 tbsp tandoori masala',
            '1 tbsp lemon juice'
          ],
        ),
        InstructionModel(
          step:
              'Add paneer, bell peppers, and onion to the marinade. Coat well and refrigerate for at least 30 minutes.',
          items: ['400g paneer', '2 bell peppers', '1 red onion'],
        ),
        InstructionModel(
          step:
              'Thread marinated paneer and vegetables onto skewers, alternating pieces.',
          items: [],
        ),
        InstructionModel(
          step:
              'Grill on medium-high heat for 12-15 minutes, turning occasionally, until charred and cooked through.',
          items: [],
        ),
      ],
      nutrition: NutritionModel(
        calories: 380,
        protein: '22g',
        carbs: '18g',
        fat: '24g',
        fiber: '4g',
        sugar: '8g',
        sodium: '620mg',
      ),
    ),
    MealModel(
      id: 'veg2',
      name: 'Wild Mushroom Risotto',
      imageUrl:
          'https://res.cloudinary.com/dehjub5m1/image/upload/meal_plannner/meal_mushroom_risotto.jpeg',
      duration: '40 minutes',
      servings: 3,
      cookware: ['Large saucepan', 'Wooden spoon', 'Small pot for broth'],
      ingredients: [
        IngredientModel(name: 'arborio rice', quantity: '1½ cups'),
        IngredientModel(name: 'mixed wild mushrooms', quantity: '300g'),
        IngredientModel(name: 'vegetable broth', quantity: '4 cups'),
        IngredientModel(name: 'white wine', quantity: '½ cup'),
        IngredientModel(name: 'parmesan cheese', quantity: '½ cup grated'),
        IngredientModel(name: 'shallot', quantity: '1, minced'),
        IngredientModel(name: 'butter', quantity: '3 tbsp'),
      ],
      instructions: [
        InstructionModel(
          step: 'Keep vegetable broth warm in a separate pot over low heat.',
          items: ['4 cups vegetable broth'],
        ),
        InstructionModel(
          step: 'Sauté mushrooms in 1 tbsp butter until golden. Set aside.',
          items: ['300g mixed wild mushrooms', '1 tbsp butter'],
        ),
        InstructionModel(
          step:
              'In the same pan, sauté shallot in remaining butter until soft. Add rice and toast for 2 minutes.',
          items: ['1 shallot', '2 tbsp butter', '1½ cups arborio rice'],
        ),
        InstructionModel(
          step: 'Pour in white wine and stir until absorbed.',
          items: ['½ cup white wine'],
        ),
        InstructionModel(
          step:
              'Add warm broth one ladle at a time, stirring constantly until absorbed before adding more. Continue for 20-25 minutes.',
          items: [],
        ),
        InstructionModel(
          step: 'Stir in mushrooms and parmesan. Season and serve immediately.',
          items: ['½ cup grated parmesan cheese'],
        ),
      ],
      nutrition: NutritionModel(
        calories: 420,
        protein: '14g',
        carbs: '58g',
        fat: '16g',
        fiber: '3g',
        sugar: '4g',
        sodium: '780mg',
      ),
    ),
    MealModel(
      id: 'veg3',
      name: 'Stuffed Pasta Shells',
      imageUrl:
          'https://res.cloudinary.com/dehjub5m1/image/upload/meal_plannner/meal_stuffed_pasta.jpeg',
      duration: '45 minutes',
      servings: 4,
      cookware: [
        'Large pot',
        'Baking dish',
        'Mixing bowl',
        'Piping bag (optional)'
      ],
      ingredients: [
        IngredientModel(name: 'jumbo pasta shells', quantity: '20 pieces'),
        IngredientModel(name: 'ricotta cheese', quantity: '2 cups'),
        IngredientModel(name: 'spinach', quantity: '2 cups, chopped'),
        IngredientModel(name: 'mozzarella cheese', quantity: '1 cup shredded'),
        IngredientModel(name: 'marinara sauce', quantity: '3 cups'),
        IngredientModel(name: 'egg', quantity: '1'),
        IngredientModel(name: 'fresh basil', quantity: '¼ cup chopped'),
      ],
      instructions: [
        InstructionModel(
          step:
              'Boil pasta shells according to package instructions until al dente. Drain and set aside.',
          items: ['20 jumbo pasta shells'],
        ),
        InstructionModel(
          step:
              'Mix ricotta, spinach, half the mozzarella, egg, and basil in a bowl.',
          items: [
            '2 cups ricotta cheese',
            '2 cups chopped spinach',
            '1 egg',
            '¼ cup fresh basil'
          ],
        ),
        InstructionModel(
          step:
              'Spread 1 cup marinara sauce in a baking dish. Stuff each shell with the ricotta mixture and arrange in the dish.',
          items: ['3 cups marinara sauce'],
        ),
        InstructionModel(
          step:
              'Top with remaining marinara and mozzarella. Bake at 375°F for 25 minutes until bubbly.',
          items: ['1 cup shredded mozzarella cheese'],
        ),
      ],
      nutrition: NutritionModel(
        calories: 460,
        protein: '24g',
        carbs: '48g',
        fat: '20g',
        fiber: '4g',
        sugar: '8g',
        sodium: '920mg',
      ),
    ),
    MealModel(
      id: 'veg4',
      name: 'Thai Green Curry with Vegetables',
      imageUrl:
          'https://res.cloudinary.com/dehjub5m1/image/upload/meal_plannner/meal_thai_curry.jpeg',
      duration: '30 minutes',
      servings: 3,
      cookware: ['Large wok or pan', 'Medium saucepan'],
      ingredients: [
        IngredientModel(name: 'green curry paste', quantity: '3 tbsp'),
        IngredientModel(name: 'coconut milk', quantity: '1 can'),
        IngredientModel(
            name: 'mixed vegetables',
            quantity: '3 cups (broccoli, carrots, bell pepper)'),
        IngredientModel(name: 'tofu', quantity: '200g, cubed'),
        IngredientModel(name: 'jasmine rice', quantity: '1 cup'),
        IngredientModel(name: 'thai basil', quantity: '¼ cup'),
        IngredientModel(name: 'soy sauce', quantity: '2 tbsp'),
      ],
      instructions: [
        InstructionModel(
          step: 'Cook jasmine rice according to package instructions.',
          items: ['1 cup jasmine rice'],
        ),
        InstructionModel(
          step:
              'Heat curry paste in a wok over medium heat for 1 minute until fragrant.',
          items: ['3 tbsp green curry paste'],
        ),
        InstructionModel(
          step: 'Add coconut milk and bring to a simmer.',
          items: ['1 can coconut milk'],
        ),
        InstructionModel(
          step:
              'Add vegetables and tofu. Simmer for 10-12 minutes until vegetables are tender.',
          items: ['3 cups mixed vegetables', '200g tofu'],
        ),
        InstructionModel(
          step: 'Stir in soy sauce and thai basil. Serve hot over rice.',
          items: ['2 tbsp soy sauce', '¼ cup thai basil'],
        ),
      ],
      nutrition: NutritionModel(
        calories: 440,
        protein: '16g',
        carbs: '46g',
        fat: '22g',
        fiber: '6g',
        sugar: '8g',
        sodium: '780mg',
      ),
    ),
    MealModel(
      id: 'veg5',
      name: 'Hearty Red Lentil Dal',
      imageUrl:
          'https://res.cloudinary.com/dehjub5m1/image/upload/meal_plannner/meal_lentil_dal.jpeg',
      duration: '35 minutes',
      servings: 4,
      cookware: ['Large pot', 'Small pan for tempering'],
      ingredients: [
        IngredientModel(name: 'red lentils', quantity: '1½ cups'),
        IngredientModel(name: 'onion', quantity: '1, diced'),
        IngredientModel(name: 'tomato', quantity: '2, diced'),
        IngredientModel(name: 'garlic', quantity: '4 cloves'),
        IngredientModel(name: 'ginger', quantity: '1 inch piece'),
        IngredientModel(name: 'turmeric powder', quantity: '1 tsp'),
        IngredientModel(name: 'cumin seeds', quantity: '1 tsp'),
        IngredientModel(name: 'ghee or oil', quantity: '2 tbsp'),
      ],
      instructions: [
        InstructionModel(
          step:
              'Rinse lentils until water runs clear. Boil with turmeric and 4 cups water until soft, about 20 minutes.',
          items: ['1½ cups red lentils', '1 tsp turmeric powder'],
        ),
        InstructionModel(
          step: 'Meanwhile, mince garlic and ginger. Dice onion and tomato.',
          items: ['4 cloves garlic', '1 inch ginger', '1 onion', '2 tomatoes'],
        ),
        InstructionModel(
          step:
              'Heat ghee in a pan, add cumin seeds until they sizzle. Add onion, garlic, ginger and sauté until golden.',
          items: ['2 tbsp ghee or oil', '1 tsp cumin seeds'],
        ),
        InstructionModel(
          step:
              'Add tomatoes and cook until soft. Pour this tempering into the cooked lentils and simmer for 5 minutes.',
          items: [],
        ),
      ],
      nutrition: NutritionModel(
        calories: 320,
        protein: '18g',
        carbs: '46g',
        fat: '8g',
        fiber: '10g',
        sugar: '6g',
        sodium: '480mg',
      ),
    ),
    MealModel(
      id: 'veg6',
      name: 'Heirloom Tomato Caprese',
      imageUrl:
          'https://res.cloudinary.com/dehjub5m1/image/upload/meal_plannner/meal_caprese_salad.jpeg',
      duration: '15 minutes',
      servings: 2,
      cookware: ['Sharp knife', 'Serving platter'],
      ingredients: [
        IngredientModel(name: 'heirloom tomatoes', quantity: '3 large, sliced'),
        IngredientModel(name: 'fresh mozzarella', quantity: '200g, sliced'),
        IngredientModel(name: 'fresh basil leaves', quantity: '¼ cup'),
        IngredientModel(name: 'extra virgin olive oil', quantity: '3 tbsp'),
        IngredientModel(name: 'balsamic glaze', quantity: '2 tbsp'),
        IngredientModel(name: 'sea salt', quantity: 'to taste'),
      ],
      instructions: [
        InstructionModel(
          step: 'Slice tomatoes and mozzarella into even rounds.',
          items: ['3 large heirloom tomatoes', '200g fresh mozzarella'],
        ),
        InstructionModel(
          step:
              'Arrange alternating slices of tomato and mozzarella on a platter.',
          items: [],
        ),
        InstructionModel(
          step: 'Tuck fresh basil leaves between the slices.',
          items: ['¼ cup fresh basil leaves'],
        ),
        InstructionModel(
          step:
              'Drizzle with olive oil and balsamic glaze. Season with sea salt and serve immediately.',
          items: [
            '3 tbsp extra virgin olive oil',
            '2 tbsp balsamic glaze',
            'sea salt to taste'
          ],
        ),
      ],
      nutrition: NutritionModel(
        calories: 280,
        protein: '14g',
        carbs: '10g',
        fat: '22g',
        fiber: '2g',
        sugar: '6g',
        sodium: '380mg',
      ),
    ),
    MealModel(
      id: 'veg7',
      name: 'Classic Margherita Pizza',
      imageUrl:
          'https://res.cloudinary.com/dehjub5m1/image/upload/meal_plannner/meal_margherita_pizza.jpeg',
      isPro: true,
      duration: '50 minutes',
      servings: 4,
      cookware: ['Pizza stone or baking sheet', 'Rolling pin', 'Mixing bowl'],
      ingredients: [
        IngredientModel(
            name: 'pizza dough', quantity: '1 ball (store-bought or homemade)'),
        IngredientModel(
            name: 'san marzano tomatoes', quantity: '1 cup, crushed'),
        IngredientModel(name: 'fresh mozzarella', quantity: '200g, torn'),
        IngredientModel(name: 'fresh basil leaves', quantity: '¼ cup'),
        IngredientModel(name: 'olive oil', quantity: '2 tbsp'),
        IngredientModel(name: 'garlic', quantity: '1 clove, minced'),
      ],
      instructions: [
        InstructionModel(
          step:
              'Preheat oven to 500°F with pizza stone inside, if using. Roll out pizza dough on a floured surface.',
          items: ['1 ball pizza dough'],
        ),
        InstructionModel(
          step:
              'Mix crushed tomatoes with minced garlic and a pinch of salt for the sauce.',
          items: ['1 cup san marzano tomatoes', '1 clove garlic'],
        ),
        InstructionModel(
          step:
              'Spread sauce evenly over the dough, leaving a border for the crust.',
          items: [],
        ),
        InstructionModel(
          step: 'Top with torn mozzarella pieces. Drizzle with olive oil.',
          items: ['200g fresh mozzarella', '2 tbsp olive oil'],
        ),
        InstructionModel(
          step:
              'Bake for 10-12 minutes until crust is golden and cheese is bubbly. Top with fresh basil before serving.',
          items: ['¼ cup fresh basil leaves'],
        ),
      ],
      nutrition: NutritionModel(
        calories: 520,
        protein: '22g',
        carbs: '58g',
        fat: '22g',
        fiber: '3g',
        sugar: '6g',
        sodium: '780mg',
      ),
    ),
  ];

  static List<MealModel> get allMeals => [
        ...mostPopular,
        ...recentlyCreated,
        ...recommendedPlan,
        ...vegetarianMeals,
      ];

  // ══════════════════════════════════════════
  //  RECENTLY CREATED
  // ══════════════════════════════════════════
  static const recentlyCreated = [
    MealModel(
      id: 'rc1',
      name: 'Indian Butter Chicken with Basmati Rice (Chicken Makhani)',
      imageUrl: 'https://res.cloudinary.com/dehjub5m1/image/upload/meal_plannner/meal_butter_chicken.png',
      duration: '40 minutes',
      servings: 4,
      cookware: ['Large skillet', 'Medium saucepan', 'Blender', 'Can opener'],
      ingredients: [
        IngredientModel(name: 'basmati rice', quantity: '½ cup'),
        IngredientModel(
          name: 'chicken or vegetable broth',
          quantity: '16 fl oz',
        ),
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
          step:
              'Using a strainer or colander, rinse the rice under cold running water, then drain and transfer to a small saucepan. Add broth and bring the mixture to a boil over high heat.',
          items: [
            '½ cup basmati rice',
            '8 fl oz (1 cup) chicken or vegetable broth',
          ],
        ),
        InstructionModel(
          step: 'Meanwhile, wash and dry the fresh produce.',
          items: [
            '1 (1 inch) piece ginger root',
            '1 jalapeño pepper',
            '½ small bunch cilantro',
            '½ pint grape tomatoes',
          ],
        ),
        InstructionModel(
          step:
              'Once the liquid comes to a boil, stir the mixture, cover the saucepan, and reduce heat to low. Cook rice until liquid is fully absorbed, 15–18 minutes. Once done, remove from heat and let it stand.',
          items: [],
          timers: [15, 5],
        ),
        InstructionModel(
          step:
              'Sauté diced onion, garlic, and ginger in butter until golden. Add tomatoes, jalapeño, and garam masala. Cook for 5 minutes then blend smooth.',
          items: [
            '1 medium yellow onion',
            '1 inch garlic',
            '2 tbsp butter',
            '2 tsp garam masala',
          ],
        ),
        InstructionModel(
          step:
              'Return blended sauce to pan. Stir in coconut milk and simmer for 10 minutes. Serve over rice and garnish with fresh cilantro.',
          items: ['½ can coconut milk', '½ small bunch cilantro'],
          timers: [10],
        ),
      ],
      nutrition: NutritionModel(
        calories: 640,
        protein: '38g',
        carbs: '58g',
        fat: '26g',
        fiber: '4g',
        sugar: '12g',
        sodium: '980mg',
      ),
    ),
    MealModel(
      id: 'rc2',
      name: 'Greek Salad with Feta Cheese & Kalamata Olives',
      imageUrl: 'https://res.cloudinary.com/dehjub5m1/image/upload/meal_plannner/meal_greek_salad.png',
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
          step:
              'Wash and chop romaine lettuce into bite-sized pieces. Place in a large salad bowl.',
          items: ['1 head romaine lettuce'],
        ),
        InstructionModel(
          step:
              'Dice cucumber, halve cherry tomatoes, and thinly slice red onion. Add all to the bowl.',
          items: [
            '1 large cucumber',
            '1 cup cherry tomatoes',
            '¼ medium red onion',
          ],
        ),
        InstructionModel(
          step: 'Add kalamata olives to the bowl.',
          items: ['½ cup kalamata olives'],
        ),
        InstructionModel(
          step:
              'Whisk together olive oil, lemon juice, and oregano to make the dressing. Pour over salad and toss gently.',
          items: [
            '3 tbsp olive oil',
            '2 tbsp lemon juice',
            '1 tsp dried oregano',
          ],
        ),
        InstructionModel(
          step: 'Crumble feta cheese generously on top and serve immediately.',
          items: ['100g feta cheese'],
        ),
      ],
      nutrition: NutritionModel(
        calories: 320,
        protein: '12g',
        carbs: '18g',
        fat: '22g',
        fiber: '4g',
        sugar: '10g',
        sodium: '840mg',
      ),
    ),
    MealModel(
      id: 'rc3',
      name: 'Italian Pasta Tomato & Basil (Pomodoro)',
      imageUrl: 'https://res.cloudinary.com/dehjub5m1/image/upload/meal_plannner/meal_italian_pasta.png',
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
          step:
              'Boil a large pot of salted water. Cook spaghetti until al dente per package instructions.',
          items: ['200g spaghetti'],
        ),
        InstructionModel(
          step:
              'In a skillet, sauté sliced garlic in olive oil over medium heat until golden. Add red pepper flakes.',
          items: [
            '3 cloves garlic',
            '3 tbsp olive oil',
            '½ tsp red pepper flakes',
          ],
        ),
        InstructionModel(
          step:
              'Pour in crushed tomatoes and simmer for 10 minutes. Season with salt to taste.',
          items: ['1 can crushed tomatoes'],
          timers: [10],
        ),
        InstructionModel(
          step:
              'Drain pasta, reserving ¼ cup pasta water. Add pasta to sauce and toss. Add pasta water as needed.',
          items: [],
        ),
        InstructionModel(
          step:
              'Stir in fresh basil. Plate and top with grated parmesan cheese.',
          items: ['¼ cup fresh basil leaves', '¼ cup grated parmesan cheese'],
        ),
      ],
      nutrition: NutritionModel(
        calories: 520,
        protein: '16g',
        carbs: '72g',
        fat: '18g',
        fiber: '6g',
        sugar: '14g',
        sodium: '560mg',
      ),
    ),
  ];

  // ══════════════════════════════════════════
  //  RECOMMENDED PLAN
  // ══════════════════════════════════════════
  static const recommendedPlan = [
    MealModel(
      id: 'rp1',
      name: 'Avocado Toast with Poached Eggs',
      imageUrl: 'https://res.cloudinary.com/dehjub5m1/image/upload/meal_plannner/meal_recommended_1.png',
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
          step:
              'Toast sourdough bread slices until golden and crispy on both sides.',
          items: ['4 slices sourdough bread'],
        ),
        InstructionModel(
          step:
              'Mash avocados with lemon juice, salt, and pepper until smooth but slightly chunky.',
          items: [
            '2 ripe avocados',
            '1 tbsp lemon juice',
            'salt & pepper to taste',
          ],
        ),
        InstructionModel(
          step:
              'Bring a saucepan of water to a gentle simmer. Poach eggs for 3–4 minutes until whites are set.',
          items: ['4 large eggs'],
        ),
        InstructionModel(
          step:
              'Spread avocado mash generously on toast. Top each with a poached egg and sprinkle chili flakes.',
          items: ['½ tsp red chili flakes'],
        ),
      ],
      nutrition: NutritionModel(
        calories: 480,
        protein: '22g',
        carbs: '38g',
        fat: '28g',
        fiber: '10g',
        sugar: '4g',
        sodium: '620mg',
      ),
    ),
    MealModel(
      id: 'rp2',
      name: 'Teriyaki Salmon with Steamed Broccoli',
      imageUrl: 'https://res.cloudinary.com/dehjub5m1/image/upload/meal_plannner/meal_recommended_2.png',
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
          step:
              'Cook jasmine rice according to package instructions. Keep warm until ready to serve.',
          items: ['1 cup jasmine rice'],
        ),
        InstructionModel(
          step:
              'Mix soy sauce, honey, sesame oil, and minced garlic together to make teriyaki sauce.',
          items: [
            '3 tbsp soy sauce',
            '2 tbsp honey',
            '1 tsp sesame oil',
            '2 cloves garlic',
          ],
        ),
        InstructionModel(
          step:
              'Steam broccoli florets for 5–6 minutes until tender-crisp. Season lightly with salt.',
          items: ['2 cups broccoli florets'],
          timers: [6],
        ),
        InstructionModel(
          step:
              'Sear salmon in a hot skillet for 3–4 minutes per side. Brush teriyaki sauce in the last 2 minutes.',
          items: ['2 salmon fillets (6 oz each)'],
          timers: [8],
        ),
        InstructionModel(
          step:
              'Serve salmon over rice with steamed broccoli. Sprinkle sesame seeds on top.',
          items: ['1 tbsp sesame seeds'],
        ),
      ],
      nutrition: NutritionModel(
        calories: 580,
        protein: '48g',
        carbs: '48g',
        fat: '18g',
        fiber: '6g',
        sugar: '16g',
        sodium: '1020mg',
      ),
    ),
    MealModel(
      id: 'rp3',
      name: 'Vegetable Stir Fry with Tofu & Brown Rice',
      imageUrl: 'https://res.cloudinary.com/dehjub5m1/image/upload/meal_plannner/meal_recommended_3.png',
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
          step:
              'Cook brown rice according to package directions, about 25 minutes. Keep warm.',
          items: ['1 cup brown rice'],
          timers: [30],
        ),
        InstructionModel(
          step:
              'Press tofu dry with paper towels and cut into 1-inch cubes. Pan-fry in sesame oil until golden on all sides.',
          items: ['200g firm tofu', '1 tbsp sesame oil'],
        ),
        InstructionModel(
          step: 'Slice bell peppers and carrots into thin strips.',
          items: ['2 mixed bell peppers', '2 medium carrots'],
        ),
        InstructionModel(
          step:
              'Stir-fry vegetables and snap peas in the same wok on high heat for 5–6 minutes until slightly charred.',
          items: ['1 cup snap peas'],
        ),
        InstructionModel(
          step:
              'Add tofu back in. Pour soy sauce and grated ginger over everything. Toss well and serve over brown rice.',
          items: ['2 tbsp soy sauce', '1 inch piece ginger root'],
        ),
      ],
      nutrition: NutritionModel(
        calories: 420,
        protein: '20g',
        carbs: '52g',
        fat: '16g',
        fiber: '8g',
        sugar: '12g',
        sodium: '780mg',
      ),
    ),
  ];

  // // ── Weekly Plan ───────────────────────────
  // static const _days = [
  //   'Monday',
  //   'Tuesday',
  //   'Wednesday',
  //   'Thursday',
  //   'Friday',
  //   'Saturday',
  //   'Sunday',
  // ];

  final weeklyPlan = <String, List<MealModel>>{
    'Monday': [],
    'Tuesday': [],
    'Wednesday': [],
    'Thursday': [],
    'Friday': [],
    'Saturday': [],
    'Sunday': [],
  }.obs;

  // ── Week navigation ───────────────────────
  final weekOffset = 0.obs; // 0 = this week, -1 = last week, +1 = next week

  DateTime get weekStart {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    return monday.add(Duration(days: weekOffset.value * 7));
  }

  DateTime weekDay(int index) => weekStart.add(Duration(days: index));

  String get weekRangeLabel {
    final start = weekStart;
    final end = weekStart.add(const Duration(days: 6));
    return '${_fmt(start)} — ${_fmt(end)}';
  }

  String _fmt(DateTime d) => '${_month(d.month)} ${d.day}';

  String _month(int m) => const [
        '',
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ][m];

  void prevWeek() => weekOffset.value--;

  void nextWeek() => weekOffset.value++;

  // ── Add / Remove meals ────────────────────
  void addMealToDay(String day, MealModel meal) {
    final updated = List<MealModel>.from(weeklyPlan[day] ?? []);
    if (!updated.any((m) => m.id == meal.id)) {
      updated.add(meal);
    }
    weeklyPlan[day] = updated;
    weeklyPlan.refresh();
  }

  void removeMealFromDay(String day, String mealId) {
    final updated = List<MealModel>.from(weeklyPlan[day] ?? [])
      ..removeWhere((m) => m.id == mealId);
    weeklyPlan[day] = updated;
    weeklyPlan.refresh();
  }

  bool get hasAnyMeals => weeklyPlan.values.any((meals) => meals.isNotEmpty);
}
