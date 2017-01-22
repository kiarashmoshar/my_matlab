T5 = taskset([11 23 9 4 9 33 12 22 25 20]);
T5.Name = {'T5t1' 'T5t2' 'T5t3' 'T5t4' 'T5t5' 'T5t6' 'T5t7' 'T5t8' 'T5t9' 'T5t10' };
p5=problem('P|pmtn|Cmax');
TS5=mcnaughtonrule(T5,p5,4);
plot(TS5)
