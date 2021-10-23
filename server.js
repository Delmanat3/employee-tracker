
const express=require('express');
const inquirer=require('inquirer');
const mysql = require('mysql2');
const start=require('./prompts/start')

const PORT = process.env.PORT || 3001;
const app = express();

app.use(express.urlencoded({ extended: false }));
app.use(express.json());

const db = mysql.createConnection(
  {
    host: 'localhost',
    user: 'root',
    password: 'pass',
    database: 'company_db'
  },
  console.log(`this bitch jivin`)
);

const parter = () => {
    inquirer.prompt(start)
       .then((answers) =>{
        switch(answers.options) {
            case "view all employees":
              viewEmp()
              break;
            case "view all roles":
              viewRoles()
              break;
            case "view all departments":
              viewDept()
              break;
            case "add new employee":
            addEmp()
            break;
            case "add new roles":
            addRoles()
            break;
            case "add new department":
              addDept();
              break;
              case "delete roles":
                delRole()
              break;
            case "delete employee":
              delEmp()
              break;
              case "delete department":
                delDep()
                break;
              case "Update employee role":
                upEmpRole()
              break;
              case "Update employee manager":
                updateEmpMan()
                break;
              case "view employee by manager":
                viewByMan()
                break;
              case "exit":
                db.end()
               break;

            default:
              console.log('how the fuck did you get here... i guess have a cookie you special fuck')
          }
        })
    }

    

app.listen(PORT, () => {
    console.log(`jivin on port ${PORT}`);
  });