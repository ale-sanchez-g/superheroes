INSERT INTO questions (
    score, answer1, answer2, correctAnswer, id, question
)
VALUES
(100,'Use your superheroes Mask and sanitizer while traveling on public transport and clean your hands regularly.','Please consider travelling during peak times, when more help is available to you','Use your superheroes Mask and sanitizer while traveling on public transport and clean your hands regularly.','bus_1','You must travel to buy food and medical supplies?'),
(90,'User your superheroes "Punch" and keep it to yourself','Move to another seat immediately and report it to the driver!','Move to another seat immediately and report it to the driver!','bus_2','Someone sits next you, and is beginning to cough, what do you do?'),
(80,'Cover any sneezes or coughs with your superhero inner elbow or with a tissue that is then discarded.','Cover any sneezes or coughs with your hand and clean it under the sit where no one will notice.','Cover any sneezes or coughs with your superhero inner elbow or with a tissue that is then discarded.','bus_3','You must travel to buy food and medical supplies?'),
(100,'Use your superhero Social Distance and notify your Manager.','Keep it to yourself, do not draw attention, and pretend you did not notice!','Use your superhero Social Distance and notify your Manager.','off_1','Your coworker Markus, is constantly coughing in the office, what do you do?'),
(90,'Use your superhero Social Distancing, notify your Manager and recommend she should be working from home.','Email Mary to see if she needs some help, and bring her a nice warm cup of tea, so she can feel better!','Use your superhero Social Distancing, notify your Manager and recommend she should be working from home.','off_2','Mary from HR, send a memo advising she is ill and everyone should reach her via email, what do you do?'),
(80,'Comfort your Manager, and assure him it is only natural to have a seasonal cold this time of the year.','Use your superhero Social Distance, advise your Manager of the risk and that his partner should be seeking medical advice.','Use your superhero Social Distance, advise your Manager of the risk and that his partner should be seeking medical advice.','off_3','Your Manager Alex, tells you his partner recently came back from overseas, and is seen constantly sneezing during the day, what do you do?'),
(100,'Use your super hero sanitizer, keep a safe distance and advise they should keep 1.5 metres away from others.','move away immediately call the police!','Use your super hero sanitizer, keep a safe distance and advise they should keep 1.5 metres away from others.','res_1','You notice a large group of people waiting in line next to each other at a restaurant, what do you do?'),
(90,'Ignore the signs, and remain oblivious or the situation','Use reasonable logic, keep distance from the waiter and report it to management!','Use reasonable logic, keep distance from the waiter and report it to management!','res_2','You notice one of the waiters serving food is ill and handling orders at a restaurant, what do you do?'),
(80,'Approach the Group as it seems Fun, and partake in the social festivities','Do not ignore the sign of possible contamination and report it to Management.','Do not ignore the sign of possible contamination and report it to Management.','res_3','You notice the people at the bar are re-using shot glasses for a group round of drinks, what do you do?'),
(1000,'Yes I know','I need to get tested now','Yes I know','end_4','Fantastic, you have succeeded on all battlefields and have not contracted covid19. A cure is not out there yet so make sure you continue the good work and keep yourself and others safe.'),
(200,'Find your closest COVID-19 testing clinics, and get tested','If you get better after a couple of days you should be fine','Find your closest COVID-19 testing clinics, and get tested','who_1','You have a cough and a mild temperature.');

INSERT INTO flows (
    id, flow_sequence
)
VALUES
('flow_2',
'{
    "stage_1": "bus_1",
    "stage_3": "res_1",
    "stage_2": "off_1",
    "stage_4": "bus_2",
    "stage_5": "off_2"
}'
)