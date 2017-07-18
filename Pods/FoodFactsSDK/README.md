# FoodFactsSDK

[![CI Status](http://img.shields.io/travis/mackensiealvarez/FoodFactsSDK.svg?style=flat)](https://travis-ci.org/mackensiealvarez/FoodFactsSDK)
[![Version](https://img.shields.io/cocoapods/v/FoodFactsSDK.svg?style=flat)](http://cocoapods.org/pods/FoodFactsSDK)
[![License](https://img.shields.io/cocoapods/l/FoodFactsSDK.svg?style=flat)](http://cocoapods.org/pods/FoodFactsSDK)
[![Platform](https://img.shields.io/cocoapods/p/FoodFactsSDK.svg?style=flat)](http://cocoapods.org/pods/FoodFactsSDK)

FoodFactsSDK Helps you get started with our amazing API in seconds.

## Requirements
- Swift 2 & Swift 3
- Xcode 7 & Xcode 8
- FoodFacts API account ([Sign up](https://api.foodfacts.com/#plans))

## Installation

FoodFactsSDK is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

For `Swift 3` use :
```ruby
pod "FoodFactsSDK"
```
For `Swift 2` use :
```ruby
pod "FoodFactsSDK", "0.2.7"
```

#### Initialization
  In your `AppDelegate` , import `FoodFactsSDK`.
```Swift
  import FoodFactsSDK
```

  Next Add Your account credentials.

```Swift
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

          FoodFacts().configuration(username: "YOUR USERNAME GOES HERE", password: "YOUR PASSWORD GOES HERE")

          return true
      }
```

You're all set and ready to go!
## Usage
#### Food Categories List

Use `FoodFacts().categoryList` to get all Categories.

```Swift
FoodFacts().categoryList(callback: {response in
            for Category in response.categoies{
                print(Category.name)
            }
        })
```

#### Food Sub-Categories List
Use `FoodFacts().subCategoryList(category_id: )` to get all Sub Categories.
Use the `parent category id` for the `category_id` parameters.

```Swift
FoodFacts().subCategoryList(category_id: 21, callback: {response in
            for category in response.categoies{
                for sub_category in category.subCategories{
                    print(sub_category.name)
                }
            }
        })
```

#### Getting Products By Category
Use `FoodFacts().productsByCategory(category_id: Int, subcategory_id: Int, per_page: Int, page: Int, sort_by: String)` to get all products for a category.

- category_id = The parent Category ID.
- subcategory_id = The Sub Category ID.
- per_page = How many products to return.
- page = Page to start.
- sort_by = What to sort the products by.
  - peg_name.sort (Name Ascending)
  - peg_name.sort:desc (Name Descending)
  - pd_score (Score Ascending)
  - pd_score:desc (Score Descending)

```Swift
FoodFacts().productsByCategory(category_id: 21, subcategory_id: 256, per_page: 4, page: 1, sort_by: "peg_name.sort", callback: {response in

           for products in response.results.products{
               print(products.title)
           }
       })

```

#### Getting Products By Search Term
Use `FoodFacts().productsBySearchTerm(search_term: String, per_page: Int, page: Int, sort_by: String)` to get all products by search term.

- search_term = The search term.
- per_page = How many products to return.
- page = Page to start.
- sort_by = What to sort the products by.
  - peg_name.sort (Name Ascending)
  - peg_name.sort:desc (Name Descending)
  - pd_score (Score Ascending)
  - pd_score:desc (Score Descending)

```Swift
  FoodFacts().productsBySearchTerm(search_term: "apples", per_page: 4, page: 1, sort_by: "peg_name.sort", callback: {response in

             for products in response.results.products{
                 print(products.title)
             }
         })

```

#### Getting Product Information By Product ID
Use `FoodFacts().productInformationByID(product_id: String)` to get a product information.

```Swift
FoodFacts().productInformationByID(product_id: "", callback: {response in
            print(response.results.productDetail.title)
        })
```

#### Getting Product Information By UPC
Use `FoodFacts().productInformationByUPC(upc: String)` to get a product information.

```Swift
FoodFacts().productInformationByUPC(upc: "075720004096", callback: {response in
            print(response.results.productDetail.title)
        })
```
## Classes
#### FFProduct
`FFProduct` contains:
- allergen_list = List of Allergens for that product.
- brand = Product Brand.
- main_category_name = Main Category name.
- product_id = Product ID.
- product_image = Image URL for the Product.
- product_upc = Product UPC code.
- sef_url = URL for the product.
- serving_size = Serving size.
- sub_category_name = Sub Category name.
- title = Name of the product.
- total_weight = Total weight for the product.
- food_facts_score = Our score for the product.
- main_category_id = Main Category ID.
- sub_category_id = Sub Category ID.
- ingredients = List of ingredients(`FFProductIngredient`)

#### FFCategory
`FFCategory` contains:
- category_id = Category ID.
- name = Category name.
- parent_category_id = Parent Category ID.
- subCategories = List of Sub Categories(`FFSubCategory`)

#### FFSubCategory
`FFSubCategory` contains:
- category_id = Sub category ID.
- name = Sub Category name.
- parent_category_id = Parent Category ID.

#### FFCategoryListResponse
`FFCategoryListResponse` contains:
- code = Status code.
- userId = Your User ID.
- apiRemaining = Api Calls Remaining.
- categoies = List of Categoies(`FFCategory`)

#### FFProductAllergen
`FFProductAllergen` contains:
- allergen_id = Allergen ID
- name = Allergen name.

#### FFProductDetail
`FFProductDetail` contains:
- allergen_list = List of Allergens for that product.
- brand = Product Brand.
- main_category_name = Main Category name.
- product_id = Product ID.
- product_image = Image URL for the Product.
- product_upc = Product UPC code.
- sef_url = URL for the product.
- serving_size = Serving size.
- sub_category_name = Sub Category name.
- title = Name of the product.
- total_weight = Total weight for the product.
- food_facts_score = Our score for the product.
- main_category_id = Main Category ID.
- sub_category_id = Sub Category ID.

#### FFProductIngredient
`FFProductIngredient` contains:
- allergens = Allergens attached to this ingredient
- ingredient_id = Ingredient ID.
- name = Ingredient name.
- order = Order of all ingredients.

#### FFProductNutrition
`FFProductNutrition` contains:
- unit_abbreviation =  Unit Abbreviation for the Product Nutrition.
- name = Name of the Nutrition.
- amount = The amount of the Nutrition.

#### FFProductReportCard
`FFProductReportCard` contains:
- good_or_bad = This returns a good or bad value.
- heading = Report card Heading.
- text = This returns a text for the report card.
- type = This returns the type of report card.

#### FFProductResponse
`FFProductResponse` contains:
- code = Status code.
- userId = Your User ID.
- apiRemaining = Api Calls Remaining.
- results = `FFProductResults`

#### FFProductResults
`FFProductResults` contains:
- productDetail = `FFProductDetail`
- productNutrition = List of Nutrition(`FFProductDetail`)
- productVitamins = List of Vitamins(`FFProductVitamin`)
- productIngredients = List of Vitamins(`FFProductIngredient`)
- productAllergens = List of Vitamins(`FFProductAllergen`)
- productReportCard = List of Vitamins(`FFProductReportCard`)

#### FFProductVitamin
`FFProductVitamin` contains:
- amount = This is the amount for the Vitamin.
- name = This is the name of the Vitamin.
- percent = This is the percentage for the Vitamin.

#### FFProductsResponse
`FFProductsResponse` contains:
- code = Status code.
- userId = Your User ID.
- apiRemaining = Api Calls Remaining.
- results = `FFProductsResults`

#### FFProductsResults
`FFProductsResults` contains:
- totalResults = Total amount of products found.
- resultsPerPage = Number of products per page.
- currentPage = Current page.
- code = status code.
- products = List of Products(`FFProduct`)

## License

FoodFactsSDK is available under the MIT license. See the LICENSE file for more info.
