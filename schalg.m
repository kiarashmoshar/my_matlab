function [TSH] = schalg(TS,problem)
%function description

%scheduling problem check
if ~(is(prob,'alpha','P2') && is(prob,'betha','rj,prec') &&
     is(prob,'gamma','Cmax'))
     error('Can not solve this problem.');
end

%initialization of variables
n = count(T);              %number of tasks
p = T.ProcTime             %vector of processing time

%scheduling algorithm

starts = 3               %assignemen of resulting start times
processor = 2            %processor assignemen

%output schedule construction
description = 'a scheduling algorithm';
TS = T;
add_schedule(TS, description, starts, p, processor);

%end of file