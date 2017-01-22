T2 = taskset([2 1 2 2]);

T2.Deadline = ([7 5 6 4]);
p2 = problem('1|rj,~dj|Cmax');
TS2 = bratley(T2,p2);
plot(TS2);