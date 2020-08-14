% variables (parameters)
var 0.0 .. 10000.0: R; % quarterly repayment
var float: P; % principal initially borrowed
var 0.0 .. 2.0: I; % interest repayment

% intermediate variables (decision vriables)
var float: B1; % balance after one quarter
var float: B2; % balance after two quarters
var float: B3; % balance after three quarters
var float: B4; % balance at the end

constraint B1 = P * (1.0 + I) - R;
constraint B2 = B1 * (1.0 + I) - R;
constraint B3 = B2 * (1.0 + I) - R;
constraint B4 = B3 * (1.0 + I) - R;

solve satisfy;

output ["Borrowing \(P) at " ++ show_float(4,2,I*100) ++ "% interest, and repaying "++ show_float(5,2,R) ++ "\n"++
"per quarter for 1 year leaves "++ show_float(4,2,B4) ++ " owing"]