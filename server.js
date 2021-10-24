
const express=require('express');
const inquirer=require('inquirer');
const mysql = require('mysql2');
const start=require('./prompts/start')
const quer =require('./prompts/adds')

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

function viewEmp(){
  db.query('SELECT employee.id AS "Employee id", concat(employee.first_name,"  ",employee.last_name ) AS "Employee Name" , role.title AS "Job Title", role.salary AS "Role Salary" ,dept.name AS "Department Name" ,concat(manager.first_name,"  ",manager.last_name) AS "Manager Name" FROM company_db.employee AS employee LEFT JOIN company_db.employee AS manager ON manager.id=employee.manager_id LEFT JOIN company_db.role AS role ON employee.role_id=role.id LEFT JOIN company_db.department AS dept ON dept.id = role.department_id',
  (err,res)=>{
    return res ? console.table(res)
      :console.log(err,'fuck a small duck')
  }
  )
parter()
}

function viewRoles(){
  db.query('SELECT role.title AS "title", role.salary AS "salary", department.name AS "department name" FROM role role LEFT JOIN department AS department ON department.id = role.department_id', 
  (err,res)=>{
    return res ? console.table(res)
      :console.log(err,'fuck a large duck')
  })
   parter()
}

function viewDept(){
  db.query('SELECT * FROM department',(err,res)=>{
    return res ? console.table(res)
     :console.log(err,'did you know ducks are free at the park')
  }
     )
     parter()
    }

function addDept(){
  inquirer.prompt([
    {
      type:'input',
      name:'department',
      description:'enter department name'
  }
  ]).then(option =>{
    db.query('INSERT INTO department SET?', 
    {name:option.department},(err,res)=>{
      if(err){
        console.log(err,'i have 5 ducks at home')
      }else{
        db.query('SELECT * FROM department',(err,res)=>{
        return res ?  console.table(res)
        : console.log(err,'weeeneer face; i did not i have sexual relations with that duck')
        }
      )
      
      parter()
      }
     }
    )
   }
  )
}




/*async function name([param[, param[, ...param]]]) {
   statements
}

promise1
.then(value => { return value + ' and bar'; })
.then(value => { return value + ' and bar again'; })
.then(value => { return value + ' and again'; })
.then(value => { return value + ' and again'; })
.then(value => { console.log(value) })
.catch(err => { console.log(err) });
 */

/**https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise */


//  const map = function(arr, cb){
//        const newArr = [];
//        for (let i = 0; i < arr.length; i++){
//            const newElem = cb(arr[i]);
//            newArr.push(newElem);
//      }
//       return newArr;
//    }
  


parter();
app.listen(PORT, () => {
    console.log(`jivin on port ${PORT}`);
  });