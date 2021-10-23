USE company_db;
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


INSERT INTO employee(first_name, last_name, role_id, manager_id)
VALUES 
    ('manage','thisdick',1,NULL),
    ('worker','apocketfullofposies',2,2),

    ('manage','abagofpenises',3,NULL),
    ('shhitbird','sam',4,2),

    ('manage','herpes',5,NULL),
    ('worker','oneinthree',6,2),

    ('CEO','bigdickryan',7,NULL),
    ('scum','nugget',8,NULL);

-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`company`.`employee`, CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`id`) ON DELETE SET NULL)
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`company`.`employee`, CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`id`))
