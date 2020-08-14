enum CONTROLS = {heat, strongly_heat, cool, strongly_cool, do_nothing};
array[CONTROLS] of int: costs = [1, 5, 3, 9, 0];
array[CONTROLS] of int: d_temps = [1, 4, -2, -5, 0];

int: start;

array[int] of int: readings;

int: array_size = length(readings);
array[1..array_size+1] of var int: temp;
array[1..array_size] of var CONTROLS :choice;
array[1..array_size] of var int :choice_cost;
array[1..array_size] of var int :choice_change;

constraint temp[1] = start;
constraint forall(i in 1..array_size)(choice_cost[i] == costs[choice[i]]);
constraint forall(i in 1..array_size)(choice_change[i] == d_temps[choice[i]]);
constraint forall(i in 1..array_size)(temp[i+1] == ((readings[i]+temp[i]) div 2) + choice_change[i]);
constraint forall(t in temp)(t >= 25 /\ t <= 30);

solve minimize sum(choice_cost);

output ["readings = \(readings); start = \(start)\n\n" ++
    "temp = \(temp)\nchoice = \(choice)\ncost = \(sum(choice_cost))"];

