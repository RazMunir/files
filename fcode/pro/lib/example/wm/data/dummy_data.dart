var transactionsData = {
  "statusCode":"200",
  "version":"0.1",
  "transactions":[
    {
      "_id": "1",
      "type": 0,
      "category": 0,
      "account": 0,
      "amount": 100,
      "about": "From home",
      "month": 10,
      "date": "2021-10-13 Sat 04:10:00 PM"
      // "date": "2020-08-12T05:12:32"
    },
    {
      "_id": "2",
      "type": 1,
      "category": 1,
      "account": 0,
      "amount": 45,
      "about": "Raozan transport",
      "month": 10,
      "date": "2021-10-13 Sat 04:10:00 PM"
    },
    {
      "_id": "3",
      "type": 1,
      "category": 1,
      "account": 0,
      "amount": 10,
      "about": "Wasa transport",
      "month": 10,
      "date": "2021-10-13 Sat 04:10:00 PM"
    },
    {
      "_id": "4",
      "type": 1,
      "category": 2,
      "account": 0,
      "amount": 15,
      "about": "In office",
      "month": 10,
      "date": "2021-10-13 Sat 04:10:00 PM"
    },
    {
      "_id": "3",
      "type": 1,
      "category": 1,
      "account": 0,
      "amount": 40,
      "about": "Raozan transport",
      "month": 10,
      "date": "2021-10-13 Sat 04:10:00 PM"
    }
  ]
};

// enum Type {deposit, expanse}
// enum account {cash, savings}
// enum Category {home, transportation, food, shopping, marketing, grocery, medicine, fruits}
// enum Month {jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec}

List<String> type = ["deposit", "expanse"];
List<String> account = ["cash", "savings"];
List<String> category = ["home", "transportation", "food", "shopping", "marketing", "grocery", "fruits"];
List<String> month = ["jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"];