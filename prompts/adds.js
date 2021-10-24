
const quer=(tab, column, choice) =>{
   return {
       message: `SELECT ${tab}:`,
       type: "list",
       name: `${column}`,
       choice
   };
}
module.exports=quer