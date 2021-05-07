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
                data:{ 
                  mood      : result[0].nom,
                  unread    : result[0].unread,
                  status    : result[0].status,
                  avatar    : result[0].avatar,
                  id_user   : result[0].id_user,
                  id_contact: result[0].id_contact
                },
                status: res.statusCode,
              });

        }
      }
    });
  }