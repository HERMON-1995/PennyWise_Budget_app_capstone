users_data = [
  {
    name: "Alice Smith",
    email: "alice@email.com",
    password: "password",
    password_confirmation: "password"
  },
  {
    name: "Bob Johnson",
    email: "bob@email.com",
    password: "password",
    password_confirmation: "password"
  }
]

users = User.create(users_data)

categories_data = [
  { name: "Groceries", icon: "fa fa-cutlery" },
  { name: "Transportation", icon: "fa fa-shopping-cart" },
  { name: "Leisure", icon: "fa fa-credit-card" },
  { name: "Bills", icon: "fa fa-heartbeat" },
  { name: "Clothing", icon: "fa fa-gamepad" },
  { name: "Healthcare", icon: "fa fa-question" },
  { name: "Other", icon: "fa fa-medkit" }
]

categories = Category.create(categories_data)

expenses_data = [
  { name: "Grocery shopping", amount: 50.00, author_id: 1, category_ids: [1] },
  { name: "Gasoline", amount: 30.00, author_id: 1, category_ids: [2] },
  { name: "Coffee with friends", amount: 10.00, author_id: 1, category_ids: [3] },
  { name: "Electricity bill", amount: 100.00, author_id: 1, category_ids: [4] },
  { name: "New shoes", amount: 75.00, author_id: 1, category_ids: [5] },
  { name: "Prescription medication", amount: 20.00, author_id: 1, category_ids: [6] },
  { name: "Dinner at a restaurant", amount: 50.00, author_id: 1, category_ids: [1] },
  { name: "Taxi ride", amount: 15.00, author_id: 1, category_ids: [2] },
  { name: "Movie tickets", amount: 25.00, author_id: 1, category_ids: [3] },
  { name: "Water bill", amount: 50.00, author_id: 1, category_ids: [4] },
  { name: "New jeans", amount: 60.00, author_id: 1, category_ids: [5] },
  { name: "First aid supplies", amount: 5.00, author_id: 1, category_ids: [6] },
  { name: "Breakfast at a cafe", amount: 15.00, author_id: 1, category_ids: [1] },
  { name: "Train ticket", amount: 10.00, author_id: 1, category_ids: [2] },
  { name: "Bowling alley", amount: 20.00, author_id: 1, category_ids: [3] },
  { name: "Internet bill", amount: 80.00, author_id: 1, category_ids: [4] },
  { name: "Sneakers", amount: 90.00, author_id: 1, category_ids: [5] }
]

expenses = Expense.create(expenses_data)
