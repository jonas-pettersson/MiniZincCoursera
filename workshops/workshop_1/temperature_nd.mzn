int: start;
array[int] of int: readings;
int: array_size = length(readings);
array[1..array_size+1] of var int: temp;
constraint temp[1] = start;
constraint forall(i in 1..array_size)(temp[i+1] == (readings[i]+temp[i]) div 2);