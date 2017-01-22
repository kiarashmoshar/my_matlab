 T1 = taskset([3 1 10 6 4]);
 T1.ReleaseTime = ([4 5 0 2 3]);
  p1 = problem('1|rj|Cmax');
TS1 = alg1rjcmax(T1,p1);
plot(TS1);
 

