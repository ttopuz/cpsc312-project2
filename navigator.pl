%course (major, required course, year)
course(cpen, cpen211, 5, core).
course(cpen, cpen221, 4, core).
course(cpen, cpen281, 3, core).
course(cpen, cpsc261, 4, core).
course(cpen, elec201, 4, core).
course(cpen, cpen291, 6, core).
course(cpen, math220, 3, core).
course(cpen, math253, 3, core).
course(cpen, math256, 3, core).

%3rd year cpen
course(cpen, cpen311, 4, core).
course(cpen, cpen331, 4, core).
course(cpen, cpen391, 6, core).
course(cpen, cpsc221, 4, core).
course(cpen, elec221, 4, core).
course(cpen, Elective, 3, core):- Elective=math318; Elective=stat251; Elective=math302; Elective=stat302.


%4th year cpen
course(cpen, apsc450, 2, core).
course(cpen, cpen481, 3, core).
course(cpen, cpen491, 10, core).

%cpen advanced

%breadth electives
course(cpen, elec202, 4, electives).
course(cpen, elec301, 4, electives).
course(cpen, elec315, 4, electives).
course(cpen, cpen321, 4, electives).
course(cpen, elec331, 4, electives).

%science electives
course(cpen, phys250, 3, science_electives). 
course(cpen, phys200, 3, science_electives).
course(cpen, phys330, 3, science_electives).
course(cpen, phys333, 3, science_electives).
course(cpen, phys404, 3, science_electives).
course(cpen, biol111, 3, science_electives).
course(cpen, biol112, 3, science_electives).
course(cpen, biol121, 3, science_electives).
course(cpen, biol123, 3, science_electives).
course(cpen, biol345, 3, science_electives).
course(cpen, chem201, 3, science_electives).
course(cpen, chem251, 3, science_electives).
course(cpen, chem260, 3, science_electives).

%credits required 
electi(cpen, complementary_studies, 9).
electi(cpen, electives, 31).
electi(cpen, science_electives, 3).
