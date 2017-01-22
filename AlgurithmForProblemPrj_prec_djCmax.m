taska1 = task('taska1',4,0,4);
taska2 = task('taska2',2,3,12);
taska3 = task('taska3',1,3,11);
taska4 = task('taska4',6,3,10);
taska5 = task('taska5',4,3,12);
prec = [0 0 0 0 0;
           0 0 0 0 0;
           0 0 0 1 0;
           0 0 0 0 0;
           0 1 0 0 0];
T6 = taskset([taska1 taska2 taska3 taska4 taska5],prec);
prob2 = problem('P|rj,prec,~dj|Cmax');
TS6 = algprjdeadlinepreccmax(T6,prob2,3);
plot(TS6);




