%run deneme then for second year checker "cpen211 cpen221 cpen281 cpen291 elec201 cpsc261 math220 math253 math256" without ""s 


getcourses:- writeln("enter course"),flush_output(current_output), readln(Courses), nb_setval(trans, Courses).

deneme:-getcourses.
%-----------------------------------------------
%checking if the peson passed the 2nd year
second_year_checker:-
            nb_getval(trans, Courses),
            write(Courses),
            member(cpen211, Courses),
            member(cpen221, Courses),
            member(cpen281, Courses),
            member(cpen291, Courses),
            member(cpsc261, Courses),
            member(elec201, Courses),
            member(math220, Courses),
            member(math253, Courses),
            member(math256, Courses),
            write("you passed second year").

second_year_checker:-
            nb_getval(trans, Courses),
            writeln("missing courses:"),
            writeln(Courses).


third_year_checker:-
            nb_getval(trans, Courses),
            write(Courses),
            member(cpen311, Courses),
            member(cpen331, Courses),
            member(cpen391, Courses),
            member(elec221, Courses),
            member(cpsc221, Courses),
            (member(math318, Courses); member(math302, Courses);
            member(stat302, Courses);
            member(stat251, Courses)),
            write("you passed third year").

fourth_year_checker:-
            nb_getval(trans, Courses),
            member(apsc450, Courses),
            member(cpen481, Courses),
            member(cpen491, Courses).

deneme(X):-course(cpen, X, 4, core, 3).


%----------------------------------------------
%main data included


%course (major, course code, credits, required or not, year)
course(cpen, cpen211, 5, core, 2).
course(cpen, cpen221, 4, core, 2).
course(cpen, cpen281, 3, core, 2).
course(cpen, cpsc261, 4, core, 2).
course(cpen, elec201, 4, core, 2).
course(cpen, cpen291, 6, core, 2).
course(cpen, math220, 3, core, 2).
course(cpen, math253, 3, core, 2).
course(cpen, math256, 3, core, 2).


%3rd year cpen
course(cpen, cpen311, 4, core, 3).
course(cpen, cpen331, 4, core, 3).
course(cpen, cpen391, 6, core, 3).
course(cpen, cpsc221, 4, core, 3).
course(cpen, elec221, 4, core, 3).
course(cpen, Elective, 3, core, 3):- Elective=math318; Elective=stat251; Elective=math302; Elective=stat302.


%4th year cpen
course(cpen, apsc450, 2, core, 4).
course(cpen, cpen481, 3, core, 4).
course(cpen, cpen491, 10, core, 4).

%cpen advanced



%breadth electives
course(cpen, elec202, 4, electives, [Y]):- member(Y, [3,4]).
course(cpen, elec301, 4, electives, [Y]):- member(Y, [3,4]).
course(cpen, elec315, 4, electives, [Y]):- member(Y, [3,4]).
course(cpen, cpen321, 4, electives, [Y]):- member(Y, [3,4]).
course(cpen, elec331, 4, electives, [Y]):- member(Y, [3,4]).

%science electives
course(cpen, phys250, 3, science_electives, 4). 
course(cpen, phys200, 3, science_electives, 4).
course(cpen, phys330, 3, science_electives, 4).
course(cpen, phys333, 3, science_electives, 4).
course(cpen, phys404, 3, science_electives, 4).
course(cpen, biol111, 3, science_electives, 4).
course(cpen, biol112, 3, science_electives, 4).
course(cpen, biol121, 3, science_electives, 4).
course(cpen, biol123, 3, science_electives, 4).
course(cpen, biol345, 3, science_electives, 4).
course(cpen, chem201, 3, science_electives, 4).
course(cpen, chem251, 3, science_electives, 4).
course(cpen, chem260, 3, science_electives, 4).

course(cpen, apsc450, 2, complementary_studies, [Y]):- member(Y, [2,3]).
course(cpen, [X], 3, complementary_studies, 2):-  member(X, [engl112, apsc201]).
course(cpen, [X], 3, complementary_studies, 2):-  member(X, [chbe459, civl403, cpen481, elec481, mine396, mtrl455]).
course(cpen, [X], 3, complementary_studies, 2):-  member(X, [apsc261, apsc262, apsc362, apsc377, apsc462, civl250, mech410T,mech410U]).


%credits required 
electi(cpen, complementary_studies, 6).
electi(cpen, electives, 31).
electi(cpen, science_electives, 3).

%second year pre_reqs
pre_req([Y, Z], cpsc261):- member(Y, [eece259, cpen211]),
                           member(Z, [eece210, cpen221]).
pre_req([Z], elec201):- 
                              member(Z, [math225, math256, math265]).
pre_req([Y, Z], cpen291) :- member(Y, [eece259, cpen211]),
                            member(Z, [eece251, elec201]).
pre_req([Y], math220) :- member(Y, [math200, math217, math226, math253, math263]).
pre_req([T, Z], math256) :-  member(T, [math221, math223]),
                                member(Z, [math220, math217, math226, math253, math263]).

%third year pre_reqs
pre_req([Y], cpen311):- member(Y, [eece259, cpen211, eece355, cpen312]).
pre_req([T, Y], cpen331):- member(T, [cpsc261]),
                           member(Y, [eece210, cpen221, eece309]).
pre_req([T, Y, Z], cpen391):- member(T, [cpen291, elec291, elec281, eece281]),
                              member(Y, [eece353, cpen311]),
                              member(Z, [eece315, cpen331]).
pre_req([Y, Z], cpsc221):- member(Y, [cpsc210, eece210, cpen221]),
                           member(Z, [cpscp121, math220]).
pre_req([Y], elec221):- member(Y, [math256, math255]).

%fourth year pre_reqs
pre_req([eece450], cpen481).
pre_req([Y], cpen491):- member(Y, [cpen391, eece381]).
