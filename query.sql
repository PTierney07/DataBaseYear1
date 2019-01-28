SELECT Equipment.EquipmentID,Make,Model,Description FROM Equipment JOIN EquipmentLoan ON Equipment.EquipmentID = EquipmentLoan.EquipmentID WHERE Damaged = 0 AND EquipmentLoan.Current = 0 and (Type LIKE '%video%' or Description like '%video%');
SELECT Employee.EmployeeID,FirstName,LastName FROM Employee JOIN Contract ON Employee.EmployeeID = Contract.EmployeeID WHERE Employee.Current = 1 and Contract.DueFinish like '2019%';
select Project.Title,Expense.Amount AS `Expenses` FROM Project JOIN Expense on Project.ProjectID = Expense.ProjectID;
SELECT FirstName, LastName, Email, MIN(Skill.Title) AS `Grade` FROM Employee JOIN EmployeeSkill ON Employee.EmployeeID = EmployeeSkill.EmployeeID JOIN Skill ON EmployeeSkill.SkillID = Skill.SkillID WHERE Skill.Title LIKE '%video%' GROUP BY FirstName;
SELECT Project.Title, COUNT(Assignment.EmployeeID) AS `No. employees assigned` FROM Project JOIN Assignment ON Project.ProjectID = Assignment.ProjectID JOIN Employee ON Assignment.EmployeeID = Employee.EmployeeID WHERE Employee.Current = 1 AND Project.Internal = 0 GROUP BY Project.Title HAVING COUNT(Assignment.ProjectID) > 2;
SELECT Employee.EmployeeID,Employee.FirstName,Employee.LastName FROM Employee LEFT JOIN Assignment ON Employee.EmployeeID = Assignment.EmployeeID WHERE NOT EXISTS (SELECT * FROM Assignment WHERE Employee.EmployeeID = Assignment.EmployeeID);
SELECT  DISTINCT Skill.Title AS `Skill Name`, ( SELECT COUNT(EmployeeSkill.SkillID)  FROM EmployeeSkill WHERE SkillID =Skill.SkillID)AS `Number of Skilled Employees` FROM Skill JOIN EmployeeSkill ON Skill.SkillID = EmployeeSkill.SkillID;
SELECT DISTINCT Employee.EmployeeID, ( SELECT COUNT(EquipmentLoan.EmployeeID) FROM EquipmentLoan WHERE EmployeeID = Employee.EmployeeID) AS `Equipment Loans`FROM Employee JOIN EquipmentLoan ON Employee.EmployeeID = EquipmentLoan.EmployeeID;
SELECT DISTINCT Employee.EmployeeID, ( SELECT COUNT(EquipmentLoan.EmployeeID) FROM EquipmentLoan WHERE EmployeeID = Employee.EmployeeID) AS `All TIme Loans`FROM Employee JOIN EquipmentLoan ON Employee.EmployeeID = EquipmentLoan.EmployeeID;
SELECT Employee.EmployeeID,Payslip.PayslipID FROM Employee JOIN Payslip ON Employee.EmployeeID = Payslip.EmployeeID JOIN Contract ON Employee.EmployeeID = Contract.EmployeeID WHERE Contract.Start NOT LIKE '%2017%' AND DueFinish NOT LIKE '%2017%';