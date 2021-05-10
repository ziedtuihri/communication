var client = require('../../../db_connection')

exports.contact=(req,res)=>{
    console.log(req.body)
    client.query(`SELECT * FROM  contact  WHERE id_user ='${req.body.id_user }' `, function  (err, result) {
      if (err){
          res.status(res.statusCode).json({
              errorCode: err.message,
              status: res.statusCode
              
              
            });
      }else{
        if(result.length==0){
          res.status(res.statusCode).json({
            message: "user not found",
            state:404,
            status: res.statusCode,
          });
        }else{
  
              res.status(res.statusCode).json({
                message: "done",
                data: result,
                status: res.statusCode,
              });

        }
      }
    });
  }