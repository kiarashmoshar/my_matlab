t1=task('task1',5,1,inf,12)
set_graphic_param(t1,'color','red')
get_graphic_param(t1,'color')
plot(t1)
pause(1)
set(t1,'ProcTime',4)
get(t1)
pause(1)
t2=task('task2',6,2,inf,10)
set_graphic_param(t2,'color','pink')
get_graphic_param(t2,'color')
plot(t2)
pause(1)
get(t2)
pause(1)
t3=task('task3',1,1,inf,11)
set_graphic_param(t3,'color','yellow')
get_graphic_param(t3,'color')
plot(t3)
pause(1)
get(t3)
pause(1)
t4=task('task4',2,1,inf,9)
set_graphic_param(t4,'color','green')
get_graphic_param(t4,'color')
plot(t4)
pause(1)
get(t4)
pause(1)
t5=task('task5',2,3,inf,8)
set_graphic_param(t5,'color','blue')
get_graphic_param(t5,'color')
plot(t5)
pause(1)
get(t5)
pause(1)
TS=taskset([t1 t2 t3 t4 t5])
prob=problem('1|pmtn,rj|Lmax')
TSH=horn(TS,prob)
display('Horn algurithm')
plot(TSH)