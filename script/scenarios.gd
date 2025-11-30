const tiles := [
	{
		"topic": "Health",
		"scenarios": [
			{
				"context": "You feel run-down but a deadline is looming.",
				"prompt": "Hey! Skip your annual check-up and come with us!",
				"yes": {"happiness": 5, "money": -8, "respect": 5, "relationship": 5},
				"no": {"happiness": -5, "money": 0, "respect": -5, "relationship": -2}
			},
			{
				"context": "You have a 6 AM meeting tomorrow.",
				"prompt": "Do you want to play with us later?",
				"yes": {"happiness": 7, "money": 5, "respect": 4, "relationship": 2},
				"no": {"happiness": -5, "money": 0, "respect": 1, "relationship": 1}
			}
		]
	},
	{
		"topic": "Neighbors",
		"scenarios": [
			{
				"context": "Last time they repaid you two months late!",
				"prompt": "Hey, can i borrow $100? I promise to pay you tom!",
				"yes": {"happiness": -15, "money": -10, "respect": 10, "relationship": 5},
				"no": {"happiness": -7, "money": 0, "respect": -3, "relationship": -7}
			},
			{
				"context": "You attended birthday party.",
				"prompt": "Hey, do you have $40? I will buy some drinks!",
				"yes": {"happiness": 2, "money": -5, "respect": 5, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -4, "relationship": -5}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	},
	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "Your partner booked a Saturday date weeks ago.",
				"prompt": "Hey! Boss asks you to work this weekend for an urgent release, can you come?",
				"yes": {"happiness": -7, "money": -3, "respect": 6, "relationship": -8},
				"no": {"happiness": 7, "money": 0, "respect": -8, "relationship": 10}
			},
			{
				"context": "Gia covered your shift last month when you were sick.",
				"prompt": "Gia can't come to work, can you cover her shift tonight?",
				"yes": {"happiness": -4, "money": 8, "respect": 4, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -5, "relationship": 0}
			}
		]
	}
]
