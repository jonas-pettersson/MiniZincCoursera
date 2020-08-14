var 0..10: x;
var int: obj = (x - 7)^2;

% var int: n;
% constraint n * 4 = x;

constraint x mod 4 = 0;

solve minimize obj;

output ["x = \(x), obj = \(obj)"]