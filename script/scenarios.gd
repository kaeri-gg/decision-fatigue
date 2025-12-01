const tiles := [
	{
		"topic": "Family",
		"scenarios": [
			{
				"context": "You just reheated your coffee for the 4th time and still haven’t taken a sip.",
				"prompt": "Mom, can you help me find my shoes?",
				"yes": {"happiness": -6, "money": 0, "respect": 3, "relationship": 7},
				"no": {"happiness": -2, "money": 0, "respect": -4, "relationship": -4}
			},
			{
				"context": "Your husband is finally massaging your shoulders.",
				"prompt": "Love, can we talk about bills right now?",
				"yes": {"happiness": -8, "money": 0, "respect": 5, "relationship": -3},
				"no": {"happiness": 4, "money": 0, "respect": -3, "relationship": 3}
			},
			{
				"context": "Both kids are screaming because the tablet died.",
				"prompt": "Mommy, can you bring me a charger?",
				"yes": {"happiness": -3, "money": 0, "respect": 2, "relationship": 6},
				"no": {"happiness": -4, "money": 0, "respect": -3, "relationship": -3}
			}
		]
	},

	{
		"topic": "Relatives",
		"scenarios": [
			{
				"context": "Your cousin who never pays back suddenly appears at your door.",
				"prompt": "Can I borrow $50? I swear this time I’ll pay!",
				"yes": {"happiness": -9, "money": -6, "respect": -3, "relationship": 2},
				"no": {"happiness": 5, "money": 0, "respect": 4, "relationship": -5}
			},
			{
				"context": "You’re in the middle of online class.",
				"prompt": "Can you help auntie to set up her email? She forgot her password again!",
				"yes": {"happiness": -6, "money": 0, "respect": 3, "relationship": 1},
				"no": {"happiness": 3, "money": 0, "respect": -3, "relationship": -2}
			},
			{
				"context": "Your niece is top 7 in their class.",
				"prompt": "Hey, your niece is top 7! You probably want to buy her new clothes?",
				"yes": {"happiness": -6, "money": -5, "respect": 4, "relationship": 1},
				"no": {"happiness": -5, "money": 0, "respect": -3, "relationship": -2}
			}
		]
	},

	{
		"topic": "Neighbors",
		"scenarios": [
			{
				"context": "Your neighborhood group chat has been quiet… too quiet.",
				"prompt": "Hi neighbor! Can we use your WiFi? Ours ‘mysteriously’ stopped.",
				"yes": {"happiness": -6, "money": 0, "respect": -3, "relationship": 3},
				"no": {"happiness": 3, "money": 0, "respect": 4, "relationship": -3}
			},
			{
				"context": "You just washed your car this morning.",
				"prompt": "Can I borrow your car? Do you have gas as well? It’s an emergency. ",
				"yes": {"happiness": -8, "money": -5, "respect": -4, "relationship": -3},
				"no": {"happiness": 4, "money": 0, "respect": 5, "relationship": -3}
			},
			{
				"context": "Your neighbor wants to borrow gasoline - again. ",
				"prompt": "Hey, do you have extra 10 liters of gas. I will tell your mom you're amazing!",
				"yes": {"happiness": -8, "money": 0, "respect": -4, "relationship": 2},
				"no": {"happiness": 7, "money": 0, "respect": 5, "relationship": -4}
			},
			{
				"context": "Your neighbor’s cat is staring at you again.",
				"prompt": "You look amazing today! Can you feed my cat for a week? We’re going on a trip!",
				"yes": {"happiness": -5, "money": -2, "respect": 3, "relationship": 2},
				"no": {"happiness": 4, "money": 0, "respect": -2, "relationship": -2}
			}
		]
	},

	{
		"topic": "Friends' Drama",
		"scenarios": [
			{
				"context": "Your friend is dragging you into drama that started on a group chat you muted months ago.",
				"prompt": "Be honest, she’s totally overreacting, isn't she?",
				"yes": {"happiness": -4, "money": 0, "respect": 5, "relationship": -1},
				"no": {"happiness": 2, "money": 0, "respect": -3, "relationship": -2}
			},
			{
				"context": "Your best friend wants validation at 2 AM about something extremely unnecessary.",
				"prompt": "Tell me, should I block him? or forgive him again?",
				"yes": {"happiness": -3, "money": 0, "respect": 4, "relationship": 5},
				"no": {"happiness": 1, "money": 0, "respect": -4, "relationship": -3}
			},
			{
				"context": "Two of your friends are fighting and you know she's wrong.",
				"prompt": "You’re on my side, right? You understand me right? Can you defend me?",
				"yes": {"happiness": -5, "money": 0, "respect": 3, "relationship": 6},
				"no": {"happiness": 3, "money": 0, "respect": -2, "relationship": -4}
			}
		]
	},

	{
		"topic": "Work",
		"scenarios": [
			{
				"context": "You just logged off after a chaotic day.",
				"prompt": "Can you fix one tiny bug before tomorrow? I have to present it to the client!",
				"yes": {"happiness": -5, "money": 5, "respect": 5, "relationship": -2},
				"no": {"happiness": 3, "money": 0, "respect": -4, "relationship": 2}
			},
			{
				"context": "You finally sat down to eat, and your team lead approached you.",
				"prompt": "Can you take this last-minute ticket? I have a meeting in 30mins.",
				"yes": {"happiness": -6, "money": 4, "respect": 4, "relationship": -1},
				"no": {"happiness": 5, "money": 0, "respect": -5, "relationship": 2}
			},
			{
				"context": "Your coworker keeps making mistakes.",
				"prompt": "Can you review my work again? It's urgent, need for next week's release.",
				"yes": {"happiness": -4, "money": 0, "respect": 6, "relationship": 2},
				"no": {"happiness": 3, "money": 0, "respect": -3, "relationship": -1}
			}
		]
	},

	{
		"topic": "Parenting",
		"scenarios": [
			{
				"context": "The kids were suspiciously quiet for 8 minutes. When you check, they’ve emptied an entire bottle of shampoo on the floor to ‘make ice skating’.",
				"prompt": "Mommy, can you clean this?",
				"yes": {"happiness": -10, "money": -4, "respect": 2, "relationship": 8},
				"no": {"happiness": -4, "money": 0, "respect": -5, "relationship": -6}
			},
			{
				"context": "You finally sat down to eat your first meal of the day and haven’t even taken a bite.",
				"prompt": "Mom, the dog ate my homework again. Can you make me a new one right now?",
				"yes": {"happiness": -8, "money": -1, "respect": 4, "relationship": 7},
				"no": {"happiness": -3, "money": 0, "respect": -3, "relationship": -5}
			},
			{
				"context": "You’re on a serious Zoom meeting with your professor, camera on, full attention required.",
				"prompt": "MOOOOOM! I clogged the toilet and the water is rising! Come fix it!",
				"yes": {"happiness": -12, "money": -3, "respect": 3, "relationship": 10},
				"no": {"happiness": -5, "money": 0, "respect": -6, "relationship": -4}
			}
		]
	},

	{
		"topic": "Ranting",
		"scenarios": [
			{
				"context": "Your classmate has been complaining nonstop for 40 minutes while you're trying to study.",
				"prompt": "Everyone in this group is useless except us, right? Do you agree?",
				"yes": {"happiness": -3, "money": 0, "respect": 6, "relationship": -2},
				"no": {"happiness": -2, "money": 0, "respect": -4, "relationship": -3}
			},
			{
				"context": "Your coworker calls you out of nowhere just to rant about another coworker you barely know.",
				"prompt": "Honestly, he should be fired already. You think so too, right? Do you agree?",
				"yes": {"happiness": -4, "money": 0, "respect": 4, "relationship": -1},
				"no": {"happiness": 2, "money": 0, "respect": -2, "relationship": -2}
			},
			{
				"context": "Your cousin is ranting about their failed relationship for the 8th time this week.",
				"prompt": "It's totally not my fault they're like that, right? Do you agree?",
				"yes": {"happiness": -5, "money": 0, "respect": 3, "relationship": 4},
				"no": {"happiness": 3, "money": 0, "respect": -3, "relationship": -4}
			}
		]
	},

	{
		"topic": "Accusations",
		"scenarios": [
			{
				"context": "A drunk relative knocks at your door at midnight, smelling like trouble.",
				"prompt": "You took my charger, didn’t you? Just admit it. Yes or no?",
				"yes": {"happiness": -6, "money": 0, "respect": 2, "relationship": 3},
				"no": {"happiness": -3, "money": 0, "respect": 4, "relationship": -5}
			},
			{
				"context": "Your relative who loses everything blames you again.",
				"prompt": "You hid my wallet so I wouldn’t go out, right? Yes or no?",
				"yes": {"happiness": -8, "money": 0, "respect": -2, "relationship": 3},
				"no": {"happiness": 4, "money": 0, "respect": 5, "relationship": -3}
			},
			{
				"context": "Your cousin shows up yelling while holding an empty bottle.",
				"prompt": "You told everyone my secret, didn’t you? Yes or no?",
				"yes": {"happiness": -7, "money": 0, "respect": -3, "relationship": 2},
				"no": {"happiness": 2, "money": 0, "respect": 4, "relationship": -4}
			}
		]
	},

	{
		"topic": "Household",
		"scenarios": [
			{
				"context": "You finally finished folding laundry.",
				"prompt": "Do you mind if I dump these clean clothes… right here?",
				"yes": {"happiness": -7, "money": 0, "respect": -1, "relationship": 3},
				"no": {"happiness": 5, "money": 0, "respect": 4, "relationship": -2}
			},
			{
				"context": "You’re wiping the table for the third time.",
				"prompt": "Can I eat my cookie right here with crumbs everywhere?",
				"yes": {"happiness": -3, "money": 0, "respect": 3, "relationship": 7},
				"no": {"happiness": -1, "money": 0, "respect": -2, "relationship": -4}
			},
			{
				"context": "The kitchen is spotless for 12 seconds.",
				"prompt": "Do you want to cook ‘something quick’ for everyone?",
				"yes": {"happiness": -6, "money": -3, "respect": 3, "relationship": 3},
				"no": {"happiness": 3, "money": 0, "respect": -3, "relationship": -1}
			}
		]
	},

	{
		"topic": "Health",
		"scenarios": [
			{
				"context": "Your skin is breaking out and you feel exhausted.",
				"prompt": "Do you want to try a new $30 moisturizer?",
				"yes": {"happiness": -2, "money": -6, "respect": 2, "relationship": 3},
				"no": {"happiness": 2, "money": 0, "respect": -1, "relationship": -1}
			},
			{
				"context": "You haven’t slept properly in days.",
				"prompt": "Do you want to drink coffee at 9 PM?",
				"yes": {"happiness": -5, "money": 0, "respect": 2, "relationship": 1},
				"no": {"happiness": 3, "money": 0, "respect": 1, "relationship": 0}
			},
			{
				"context": "You feel dizzy but still have work to do.",
				"prompt": "Do you want to skip resting and finish everything now?",
				"yes": {"happiness": -6, "money": 0, "respect": 3, "relationship": 1},
				"no": {"happiness": 4, "money": 0, "respect": -2, "relationship": 0}
			}
		]
	},

	{
		"topic": "In-Laws",
		"scenarios": [
			{
				"context": "Your in-laws love the kids but demand a lot of energy.",
				"prompt": "Can you bring the kids over right now?",
				"yes": {"happiness": -3, "money": -2, "respect": 4, "relationship": 6},
				"no": {"happiness": 2, "money": 0, "respect": -3, "relationship": -3}
			},
			{
				"context": "You have homework due tonight.",
				"prompt": "Could you fix our TV again?",
				"yes": {"happiness": -5, "money": 0, "respect": 5, "relationship": 3},
				"no": {"happiness": 1, "money": 0, "respect": -4, "relationship": -1}
			},
			{
				"context": "You finally sat down.",
				"prompt": "Can you visit us today? We’re lonely.",
				"yes": {"happiness": -3, "money": -2, "respect": 5, "relationship": 7},
				"no": {"happiness": -1, "money": 0, "respect": -4, "relationship": -3}
			}
		]
	},

	{
		"topic": "Random Emergencies",
		"scenarios": [
			{
				"context": "You were about to nap for 20 minutes.",
				"prompt": "The sink is overflowing. Can you deal with it?",
				"yes": {"happiness": -8, "money": -7, "respect": 4, "relationship": -1},
				"no": {"happiness": -3, "money": -1, "respect": -2, "relationship": 0}
			},
			{
				"context": "Rain is pouring like the apocalypse.",
				"prompt": "Do you want to pick up the package outside before it melts?",
				"yes": {"happiness": -4, "money": 0, "respect": 3, "relationship": 0},
				"no": {"happiness": 2, "money": 0, "respect": -3, "relationship": 0}
			},
			{
				"context": "The doorbell rings at 11 PM.",
				"prompt": "Do you want to check who it is?",
				"yes": {"happiness": -6, "money": 0, "respect": 2, "relationship": 0},
				"no": {"happiness": 4, "money": 0, "respect": -2, "relationship": 0}
			}
		]
	},

	{
		"topic": "Transportation",
		"scenarios": [
			{
				"context": "Traffic is a nightmare and you’re running late.",
				"prompt": "Do you want to drive anyway instead of canceling plans?",
				"yes": {"happiness": -5, "money": -5, "respect": 3, "relationship": 1},
				"no": {"happiness": 3, "money": 0, "respect": -2, "relationship": -1}
			},
			{
				"context": "Your car is almost out of gas.",
				"prompt": "Do you want to try your luck and drive without refueling?",
				"yes": {"happiness": -6, "money": -2, "respect": 2, "relationship": 0},
				"no": {"happiness": 3, "money": -1, "respect": 1, "relationship": 0}
			},
			{
				"context": "The kids want to go somewhere far.",
				"prompt": "Do you want to go even if it means hearing whining all the way?",
				"yes": {"happiness": -4, "money": -3, "respect": 3, "relationship": 7},
				"no": {"happiness": -2, "money": 0, "respect": -3, "relationship": -4}
			}
		]
	},

	{
		"topic": "Social Obligations",
		"scenarios": [
			{
				"context": "You want to hide under your blanket forever.",
				"prompt": "Your friend invites you to a dinner you forgot about. Go?",
				"yes": {"happiness": -4, "money": -6, "respect": 3, "relationship": 5},
				"no": {"happiness": 4, "money": 0, "respect": -4, "relationship": -4}
			},
			{
				"context": "You wanted a quiet night.",
				"prompt": "Coworkers ask you to join a group video call.",
				"yes": {"happiness": -3, "money": 0, "respect": 3, "relationship": 5},
				"no": {"happiness": 3, "money": 0, "respect": -3, "relationship": -2}
			},
			{
				"context": "You finally sat down with a snack.",
				"prompt": "Do you want to host tonight’s family get-together?",
				"yes": {"happiness": -7, "money": -5, "respect": 3, "relationship": 4},
				"no": {"happiness": 4, "money": 0, "respect": -4, "relationship": -4}
			}
		]
	},

	{
		"topic": "Chores",
		"scenarios": [
			{
				"context": "The sink is full again.",
				"prompt": "Do you want to wash the dishes even though it’s not your turn?",
				"yes": {"happiness": -6, "money": 0, "respect": 4, "relationship": 3},
				"no": {"happiness": 3, "money": 0, "respect": -4, "relationship": -1}
			},
			{
				"context": "Someone left crumbs everywhere.",
				"prompt": "Do you want to clean it even though you didn’t make the mess?",
				"yes": {"happiness": -4, "money": 0, "respect": 3, "relationship": 2},
				"no": {"happiness": 2, "money": 0, "respect": -3, "relationship": -2}
			},
			{
				"context": "Laundry mountain is real.",
				"prompt": "Do you want to wash everything tonight?",
				"yes": {"happiness": -7, "money": 0, "respect": 5, "relationship": 3},
				"no": {"happiness": 3, "money": 0, "respect": -3, "relationship": -2}
			}
		]
	},

	{
		"topic": "Personal Development",
		"scenarios": [
			{
				"context": "You want to try journaling again.",
				"prompt": "Do you want to start a new hobby even though you’re overwhelmed?",
				"yes": {"happiness": -2, "money": -4, "respect": 3, "relationship": 1},
				"no": {"happiness": 3, "money": 0, "respect": -1, "relationship": 0}
			},
			{
				"context": "You have an online course you never touched.",
				"prompt": "Do you want to buy a second course?",
				"yes": {"happiness": -3, "money": -8, "respect": 3, "relationship": 2},
				"no": {"happiness": 3, "money": 0, "respect": -1, "relationship": -1}
			},
			{
				"context": "You wanted to meditate for self-care.",
				"prompt": "Your friend asks if you want to join a productivity challenge.",
				"yes": {"happiness": -3, "money": 0, "respect": 4, "relationship": 4},
				"no": {"happiness": 2, "money": 0, "respect": -2, "relationship": -1}
			}
		]
	}
]
