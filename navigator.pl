% main function which takes input from the user and saves it to a global variable 
% cpen211 cpen221 cpen281 cpsc261 elec201 cpen291 math220 math253 math256 apsc201 chbe459 (successfully passed 2nd year)
degreeNavigator:-
    writeln("Welcome the Degree Navigator! Enter the courses you have taken so far."),
    flush_output(current_output),
    readln(Courses),
    nb_setval(transcript, Courses).

% Checkyear2 return true if checkcore2 and checkelective2 returns true
checkYear2:-
    nb_getval(transcript, Courses),
    checkCore2(Courses),
    checkElective2(Courses),
    writeln("You have successfully fulfilled the courses to pass Year2").

% checkYear3 returns true if checkyear2, checkcore3, checkelectives returns true.
checkYear3:-
    nb_getval(transcript, Courses),
    checkYear2,
    checkCore3(Courses),
    checkElective3(Courses),
    writeln("You have successfully fulfilled the courses to pass Year3").

% Checks if the person passed 4th year
checkYear4:-
    nb_getval(transcript, Courses),
    checkYear3,
    checkCore4(Courses),
    checkElective3(Courses),
    writeln("You have successfully fulfilled the courses to pass Year4").

whatismycurrentcredit:-
    nb_getval(transcript, Courses),
    creditCounter(Courses, Credits),
    write(Credits).
%---------------------------------------------------------
%           HELPER FUNCTIONS
%---------------------------------------------------------


% Check year2 core courses
checkCore2(Courses):-
    member(cpen211, Courses), member(cpen221, Courses), member(cpen281, Courses), member(cpsc261, Courses),
    member(elec201, Courses), member(cpen291, Courses), member(math220, Courses), member(math253, Courses),
    member(math256, Courses).

% Check year2 elective course (the user must have taken at least one elective)
checkElective2(Courses):-
    member(apsc201, Courses); member(chbe459, Courses); member(civl403, Courses);
    member(cpen481, Courses); member(elec481, Courses); member(mine396, Courses).

% Check year3 core courses
checkCore3(Courses):-
    member(cpen311, Courses), member(cpen331, Courses), member(cpen391, Courses),
    member(cpsc221, Courses), member(elec221, Courses).

% Check year3 elective course
checkElective3(Courses):-
    member(elec202, Courses); member(elec301, Courses); member(elec315, Courses);
    member(cpen321, Courses); member(elec331, Courses).

% Check year4 core courses
checkCore4(Courses):-
    member(apsc450, Courses), member(cpen481, Courses), member(cpen491, Courses).


creditCounter([],0).
creditCounter([H|T], Credits) :-
    course(H, A, _, _), 
    creditCounter(T, Rest), 
    Credits is A + Rest.
%----------------------------------------------------------------------------------------------
%----------------------------------------------------------------------------------------------
%----------------------------------------------------------------------------------------------
% Prerequisite Functionality

checkPreReq(C):- 
    writeln("Enter the course that you would like to check its prereqs."),
    readln(input),
    course(input, _),
    pre_req(C, input).

% course (course code, type)

% Core Courses for 2nd year
course(cpen211, 5, core, 2).
course(cpen221, 4, core, 2).
course(cpen281, 3, core, 2).
course(cpsc261, 4, core, 2).
course(elec201, 4, core, 2).
course(cpen291, 6, core, 2).
course(math220, 3, core, 2).
course(math253, 3, core, 2).
course(math256, 3, core, 2).


%3rd year cpen
course(cpen311, 4, core, 3).
course(cpen331, 4, core, 3).
course(cpen391, 6, core, 3).
course(cpsc221, 4, core, 3).
course(elec221, 4, core, 3).
course(Elective, 3, core, 3):- Elective=math318; Elective=stat251; Elective=math302; Elective=stat302.

% Core Courses for 4th year
course(apsc450, 2, core, 4).
course(cpen481, 3, core, 4).
course(cpen491, 10, core, 4).

% Breadth Electives during 3rd or 4th year
course(elec202, 4, electives, 3).
course(elec301, 4, electives, 3).
course(elec315, 4, electives, 3).
course(cpen321, 4, electives, 3).
course(elec331, 4, electives, 3).

course(elec202, 4, electives, 4).
course(elec301, 4, electives, 4).
course(elec315, 4, electives, 4).
course(cpen321, 4, electives, 4).
course(elec331, 4, electives, 4).

% Elective Courses for 2nd year
course(apsc201, 3, electives, 2).
course(chbe459, 3, electives, 2).
course(civl403, 3, electives, 2).
course(cpen481, 3, electives, 2).
course(elec481, 3, electives, 2).
course(mine396, 3, electives, 2).
course(mtrl455, 3, electives, 2).
course(apsc261, 3, electives, 2).
course(apsc262, 3, electives, 2).
course(apsc362, 3, electives, 2).
course(apsc377, 3, electives, 2).
course(apsc462, 3, electives, 2).
course(civl250, 3, electives, 2).
course(mech410T, 3, electives, 2).
course(mech410U, 3, electives, 2).

course(apsc201, 3, electives, 3).
course(chbe459, 3, electives, 3).
course(civl403, 3, electives, 3).
course(cpen481, 3, electives, 3).
course(elec481, 3, electives, 3).
course(mine396, 3, electives, 3).
course(mtrl455, 3, electives, 3).
course(apsc261, 3, electives, 3).
course(apsc262, 3, electives, 3).
course(apsc362, 3, electives, 3).
course(apsc377, 3, electives, 3).
course(apsc462, 3, electives, 3).
course(civl250, 3, electives, 3).
course(mech410T, 3, electives, 3).
course(mech410U, 3, electives, 3).





% second year pre_reqs
pre_req([Y, Z], cpsc261):- member(Y, [eece259, cpen211]),
                           member(Z, [eece210, cpen221]).
pre_req([Z], elec201):-
                              member(Z, [math225, math256, math265]).
pre_req([Y, Z], cpen291) :- member(Y, [eece259, cpen211]),
                            member(Z, [eece251, elec201]).
pre_req([Y], math220) :- member(Y, [math200, math217, math226, math253, math263]).
pre_req([T, Z], math256) :-  member(T, [math221, math223]),
                                member(Z, [math220, math217, math226, math253, math263]).

% third year pre_reqs
pre_req([Y], cpen311):- member(Y, [eece259, cpen211, eece355, cpen312]).
pre_req([T, Y], cpen331):- member(T, [cpsc261]),
                           member(Y, [eece210, cpen221, eece309]).
pre_req([T, Y, Z], cpen391):- member(T, [cpen291, elec291, elec281, eece281]),
                              member(Y, [eece353, cpen311]),
                              member(Z, [eece315, cpen331]).
pre_req([Y, Z], cpsc221):- member(Y, [cpsc210, eece210, cpen221]),
                           member(Z, [cpscp121, math220]).
pre_req([Y], elec221):- member(Y, [math256, math255]).

% fourth year pre_reqs
pre_req([eece450], cpen481).
pre_req([Y], cpen491):- member(Y, [cpen391, eece381]).