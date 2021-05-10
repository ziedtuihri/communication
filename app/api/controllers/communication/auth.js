var client = require('../../../db_connection')
const jwt = require("jsonwebtoken");

exports.singin=(req,res)=>{
    console.log(req.body)
    client.query(`SELECT * FROM  user  WHERE email='${req.body.email}' && password='${req.body.password}' `, function  (err, result) {
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
           jwt.sign({ user_auth: {nom:result[0].nom,email:result[0].email} },process.env.secret_key_token_auth_event,{ expiresIn: '86400s' },
          async (err, token) => {
             if(err){
               res.status(res.statusCode).json({
                 message: err.message,
                 status: res.statusCode,
                 state: false,
               });
             }else{
              res.status(res.statusCode).json({
                message: "done",
                token:token,
                data:{ 
                  nom       : result[0].nom,
                  prenom    : result[0].prenom,
                  email     : result[0].email,
                  id_role   : result[0].id_role,
                  id_user   : result[0].id_user,
                  sexe      : result[0].sexe
                },
                status: res.statusCode,
              });
             }
     
           },
           
         );
        }
      }
    });
  }