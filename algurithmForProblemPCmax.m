T4=taskset([7 7 6 6 5 5 4 4 4]);
T4.Name={'T4t1' 'T4t2' 'T4t3' 'T4t4' 'T4t5' 'T4t6' 'T4t7' 'T4t8' 'T4t9'};
p4=problem('P||Cmax');
TS4=algpcmax(T4,p4,4);
plot(TS4);

