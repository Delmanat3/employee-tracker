const inquirer = require('inquirer')
const start =[
 
        {
            type: 'list',
            message: 'CHOOSE OPTION BELOW',
            name: 'options',
            choices: [
                'view all employees',
                'view all roles',
                'view all departments',
                'add new employee',
                'add new roles',
                'add new department',
                'delete roles',
                'delete employee',
                'delete department',
                'Update employee role',
                'Update employee manager',
                'view employee by manager',
                'exit'
            ]
        }
    ];
module.exports = start