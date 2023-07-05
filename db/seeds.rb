
users =
  User.create(
    [
      {
        name: "John Doe",
        email: "john@email.com",
        password: "password",
        password_confirmation: "password"
      },
      {
        name: "Jane Doe",
        email: "jane@email.com",
        password: "password",
        password_confirmation: "password"
      }
    ]
  )

categories =
  Category.create(
    [
      { name: "Food", icon: "fa-solid fa-utensils" },
      { name: "Transportation", icon: "fa-solid fa-bus" },
      { name: "Entertainment", icon: "fa-solid fa-gamepad" },
      { name: "Utilities", icon: "fa-solid fa-bolt" },
      { name: "Clothing", icon: "fa-solid fa-tshirt" },
      { name: "Health", icon: "fa-solid fa-heartbeat" },
      { name: "Other", icon: "fa-solid fa-question" }
    ]
  )

expenses =
  Expense.create(
    [
      { name: "Lunch", amount: 10.00, author_id: 1, category_ids: [1] },
      { name: "Bus", amount: 2.00, author_id: 1, category_ids: [2] },
      { name: "Movie", amount: 15.00, author_id: 1, category_ids: [3] },
      { name: "Electricity", amount: 50.00, author_id: 1, category_ids: [4] },
      { name: "Shirt", amount: 20.00, author_id: 1, category_ids: [5] },
      { name: "Medicine", amount: 5.00, author_id: 1, category_ids: [6] },
      { name: "Dinner", amount: 15.00, author_id: 1, category_ids: [1] },
      { name: "Uber", amount: 10.00, author_id: 1, category_ids: [2] },
      { name: "Concert", amount: 50.00, author_id: 1, category_ids: [3] },
      { name: "Water", amount: 5.00, author_id: 1, category_ids: [4] },
      { name: "Pants", amount: 30.00, author_id: 1, category_ids: [5] },
      { name: "Bandage", amount: 2.00, author_id: 1, category_ids: [6] },
      { name: "Breakfast", amount: 5.00, author_id: 1, category_ids: [1] },
      { name: "Train", amount: 5.00, author_id: 1, category_ids: [2] },
      { name: "Bowling", amount: 20.00, author_id: 1, category_ids: [3] },
      { name: "Gas", amount: 30.00, author_id: 1, category_ids: [4] },
      { name: "Shoes", amount: 50.00, author_id: 1, category_ids: [5] }
    ]
  )