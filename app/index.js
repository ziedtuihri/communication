/*******don't touch this folder*******/
const app = require('./app')
const cors = require('cors');
app.use(cors());
const port =  5010

const debug = require('debug')('angular2-nodejs:server');

let http = require("http").createServer(app);


/**
 * Event listener for HTTP server "error" event.
 */
function onError(error) {
  if (error.syscall !== 'listen') {
    throw error;
  }

  var bind = typeof port === 'string'
    ? 'Pipe ' + port
    : 'Port ' + port;

  // handle specific listen errors with friendly messages
  switch (error.code) {
    case 'EACCES':
      console.error(bind + ' requires elevated privileges');
      process.exit(1);
      break;
    case 'EADDRINUSE':
      console.error(bind + ' is already in use');
      process.exit(1);
      break;
    default:
      throw error;
  }
}

/**
 * Event listener for HTTP server "listening" event.
 */

function onListening() {
  var addr = http.address();
  var bind = typeof addr === 'string'
    ? 'pipe ' + addr
    : 'port ' + addr.port;
  debug('Listening on ' + bind);
}

/**
 * Socket connection .
 */

 let io = require("socket.io")(http, {
  cors: {
    origin: "http://localhost:4200",
    methods: ["GET", "POST"],
    credentials: true,
    transports: ['websocket', 'polling'],
},
allowEIO3: true
});

const activeUsers = new Set();

  io.on("connection", function (socket) {
    console.log("A user is connected", socket.id);
    socket.on('userConnected', socket.join);
    socket.on('userDisconnected', socket.leave);


    socket.on('my message', (msg) => {
      console.log('message: ' + msg);
    });

    socket.on("private message", ({ content, to }) => {
      console.log(to + 'message: tesssttt ' + content);
      socket.to(to).emit("private message", {
        content,
        from: socket.id,
      });
      
    });
  
  });




/********************************/
http.listen(port, () => {
  console.log(`started on port ${port}`);
});

http.on('error', onError);
http.on('listening', onListening);
