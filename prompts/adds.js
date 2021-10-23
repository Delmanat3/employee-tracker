/**
 constructor for adding employees
 class add{
     constructor()
 }
 */
 class Employee {
    constructor( name, id, email ) {
       this.name = name;
       this.id = id;
       this.email = email;
       this.role = "Employee";
    };
 
    theName() {
       return this.name;
    };
 
    theId() {
       return this.id;
    };
 
    theEmail() {
       return this.email;
    };
 
    theRole() {
       return this.role;
    };
 };
 
 module.exports = Employee;