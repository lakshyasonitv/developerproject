// Generated from data/test-data.json
// Clears old TalentBridge test data, then loads the data in the repository file.
List<Account> existingAccounts = [SELECT Id FROM Account WHERE Name IN ('TV', 'MediCare Plus', 'EduCore', 'FinTrust')];
delete [SELECT Id FROM Hiring__c];
delete [SELECT Id FROM Position__c];
delete [SELECT Id FROM Consultant__c];
delete [SELECT Id FROM Contact WHERE AccountId IN :existingAccounts];
delete existingAccounts;

// 1. Employers (at least 3, one called "TV")
Account emp0 = new Account(Name = 'TV', Domain__c = 'IT');
Account emp1 = new Account(Name = 'MediCare Plus', Domain__c = 'Healthcare');
Account emp2 = new Account(Name = 'EduCore', Domain__c = 'Education');
Account emp3 = new Account(Name = 'FinTrust', Domain__c = 'Finance');
insert new List<Account>{ emp0, emp1, emp2, emp3 };

// HR Contacts for each employer
Contact hr0 = new Contact(FirstName = 'Ravi', LastName = 'Kumar', Email = 'ravi.kumar@tv.example.com', AccountId = emp0.Id);
Contact hr1 = new Contact(FirstName = 'Neha', LastName = 'Sharma', Email = 'neha.sharma@medicareplus.example.com', AccountId = emp1.Id);
Contact hr2 = new Contact(FirstName = 'Arjun', LastName = 'Singh', Email = 'arjun.singh@educore.example.com', AccountId = emp2.Id);
Contact hr3 = new Contact(FirstName = 'Priya', LastName = 'Mehta', Email = 'priya.mehta@fintrust.example.com', AccountId = emp3.Id);
insert new List<Contact>{ hr0, hr1, hr2, hr3 };

emp0.HR_Contact__c = hr0.Id;
emp1.HR_Contact__c = hr1.Id;
emp2.HR_Contact__c = hr2.Id;
emp3.HR_Contact__c = hr3.Id;
update new List<Account>{ emp0, emp1, emp2, emp3 };

// 2. Consultants (10 consultants: 3+ last names starting with "S", one called John)
Consultant__c con0 = new Consultant__c(First_Name__c = 'John', Last_Name__c = 'Smith', DOB__c = Date.newInstance(1990, 5, 14), Gender__c = 'Male', Email__c = 'john.smith@example.com', Married__c = true, Education__c = 'BTech');
Consultant__c con1 = new Consultant__c(First_Name__c = 'Alice', Last_Name__c = 'Sharma', DOB__c = Date.newInstance(1995, 8, 22), Gender__c = 'Female', Email__c = 'alice.sharma@example.com', Married__c = false, Education__c = 'MCA');
Consultant__c con2 = new Consultant__c(First_Name__c = 'Bob', Last_Name__c = 'Singh', DOB__c = Date.newInstance(1988, 11, 2), Gender__c = 'Male', Email__c = 'bob.singh@example.com', Married__c = true, Education__c = 'BE');
Consultant__c con3 = new Consultant__c(First_Name__c = 'Carol', Last_Name__c = 'Johnson', DOB__c = Date.newInstance(1992, 3, 17), Gender__c = 'Female', Email__c = 'carol.johnson@example.com', Married__c = false, Education__c = 'MTech');
Consultant__c con4 = new Consultant__c(First_Name__c = 'David', Last_Name__c = 'Williams', DOB__c = Date.newInstance(1985, 7, 9), Gender__c = 'Male', Email__c = 'david.williams@example.com', Married__c = true, Education__c = 'BTech');
Consultant__c con5 = new Consultant__c(First_Name__c = 'Emma', Last_Name__c = 'Brown', DOB__c = Date.newInstance(1998, 1, 30), Gender__c = 'Female', Email__c = 'emma.brown@example.com', Married__c = false, Education__c = 'MCA');
Consultant__c con6 = new Consultant__c(First_Name__c = 'Frank', Last_Name__c = 'Davis', DOB__c = Date.newInstance(1999, 9, 12), Gender__c = 'Male', Email__c = 'frank.davis@example.com', Married__c = false, Education__c = 'BE');
Consultant__c con7 = new Consultant__c(First_Name__c = 'Grace', Last_Name__c = 'Wilson', DOB__c = Date.newInstance(1993, 12, 5), Gender__c = 'Female', Email__c = 'grace.wilson@example.com', Married__c = false, Education__c = 'MTech');
Consultant__c con8 = new Consultant__c(First_Name__c = 'Henry', Last_Name__c = 'Taylor', DOB__c = Date.newInstance(1991, 6, 25), Gender__c = 'Male', Email__c = 'henry.taylor@example.com', Married__c = true, Education__c = 'BTech');
Consultant__c con9 = new Consultant__c(First_Name__c = 'Irene', Last_Name__c = 'Moore', DOB__c = Date.newInstance(1996, 4, 18), Gender__c = 'Female', Email__c = 'irene.moore@example.com', Married__c = false, Education__c = 'MCA');
insert new List<Consultant__c>{ con0, con1, con2, con3, con4, con5, con6, con7, con8, con9 };

// 3. Positions (6 positions, one called "Software Engineer")
Position__c pos0 = new Position__c(Name = 'Software Engineer', Employer__c = emp0.Id, Openings__c = 3, Status__c = 'Open', Hourly_Rate__c = 45.00, Description__c = 'Design, build and maintain the TalentBridge platform.');
Position__c pos1 = new Position__c(Name = 'Data Analyst', Employer__c = emp0.Id, Openings__c = 2, Status__c = 'Open', Hourly_Rate__c = 35.00, Description__c = 'Analyse hiring and placement data for the IT team.');
Position__c pos2 = new Position__c(Name = 'Registered Nurse', Employer__c = emp1.Id, Openings__c = 4, Status__c = 'Open', Hourly_Rate__c = 40.00, Description__c = 'Provide direct patient care in the MediCare Plus network.');
Position__c pos3 = new Position__c(Name = 'Care Coordinator', Employer__c = emp1.Id, Openings__c = 1, Status__c = 'Filled', Hourly_Rate__c = 25.00, Description__c = 'Coordinate care plans for patients across facilities.');
Position__c pos4 = new Position__c(Name = 'Math Teacher', Employer__c = emp2.Id, Openings__c = 2, Status__c = 'Open', Hourly_Rate__c = 30.00, Description__c = 'Teach mathematics to secondary school students.');
Position__c pos5 = new Position__c(Name = 'Financial Analyst', Employer__c = emp3.Id, Openings__c = 1, Status__c = 'Closed', Hourly_Rate__c = 38.00, Description__c = 'Support budgeting and financial planning for FinTrust.');
insert new List<Position__c>{ pos0, pos1, pos2, pos3, pos4, pos5 };

// 4. Hirings (8 hirings, some older than 90 days)
Hiring__c hir0 = new Hiring__c(Employer__c = emp0.Id, Consultant__c = con0.Id, Hire_Date__c = Date.newInstance(2025, 1, 15), Position__c = pos0.Id);
Hiring__c hir1 = new Hiring__c(Employer__c = emp0.Id, Consultant__c = con1.Id, Hire_Date__c = Date.newInstance(2025, 3, 20), Position__c = pos1.Id);
Hiring__c hir2 = new Hiring__c(Employer__c = emp0.Id, Consultant__c = con2.Id, Hire_Date__c = Date.newInstance(2026, 9, 1), Position__c = pos0.Id);
Hiring__c hir3 = new Hiring__c(Employer__c = emp1.Id, Consultant__c = con3.Id, Hire_Date__c = Date.newInstance(2025, 7, 1), Position__c = pos2.Id);
Hiring__c hir4 = new Hiring__c(Employer__c = emp1.Id, Consultant__c = con4.Id, Hire_Date__c = Date.newInstance(2026, 10, 1), Position__c = pos3.Id);
Hiring__c hir5 = new Hiring__c(Employer__c = emp2.Id, Consultant__c = con5.Id, Hire_Date__c = Date.newInstance(2025, 5, 10), Position__c = pos4.Id);
Hiring__c hir6 = new Hiring__c(Employer__c = emp2.Id, Consultant__c = con6.Id, Hire_Date__c = Date.newInstance(2026, 9, 15));
Hiring__c hir7 = new Hiring__c(Employer__c = emp3.Id, Consultant__c = con7.Id, Hire_Date__c = Date.newInstance(2026, 10, 20), Position__c = pos5.Id);
insert new List<Hiring__c>{ hir0, hir1, hir2, hir3, hir4, hir5, hir6, hir7 };

System.debug('Loaded ' + 4 + ' employers, ' + 10 + ' consultants, ' + 6 + ' positions and ' + 8 + ' hirings.');

