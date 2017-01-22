T3=taskset([7 8 4 6 6]);
T3.DueDate=([9 17 18 19 21]);
p3=problem('1||sumUj');
TS3=alg1sumuj(T3,p3);
plot(TS3)