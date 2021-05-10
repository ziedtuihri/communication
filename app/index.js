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
    console.log("Made socket connection");
  
    socket.on('my message', (msg) => {
      io.emit('my broadcast', `server: ${msg}`);
    });

    socket.on("new user", function (data) {
      socket.userId = data;
      activeUsers.add(data);
      io.emit("new user", [...activeUsers]);
    });
  
    socket.on("disconnect", () => {
      activeUsers.delete(socket.userId);
      io.emit("user disconnected", socket.userId);
    });
  });




/********************************/
http.listen(port, () => {
  console.log(`started on port ${port}`);
});

http.on('error', onError);
http.on('listening', onListening);
