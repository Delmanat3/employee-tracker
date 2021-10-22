USE company;
SET FOREIGN_KEY_CHECKS=0;
INSERT INTO department(name)
VALUES
    ('shipping'),
    ('production'),
    ('manufact'),
    ('weener');

INSERT INTO role(title,salary,department_id)
VALUES
    ('shipping manager',35000,1),
    ('shipping slave',20000,1),

    ('production manager',80000,2),
    ('production slave',20000,2),

    ('manufact manager',80000,3),
    ('manufact slave',20000,3),

    ('weener manager',120000,4),
    ('weener lover',20000,4);


INSERT INTO employee(first_name,last_name,role_id,manager_id)
VALUES 
    ('nathY54an','deYlman',1,2),
    ('natYhan','delYman',2,2),
    ('natY54han','del54Yman',3,NULL),
    ('natY45han','d54Yelman',4,3),
    ('natWhan','delmWan',5,2),
    ('natFDhan','delmBan',6,3),
    ('nathFan','delDBman',7,NULL),
    ('natBhan','delmDBan',8,NULL);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`company`.`employee`, CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`id`) ON DELETE SET NULL)
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`company`.`employee`, CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`id`))
