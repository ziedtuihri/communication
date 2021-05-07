/*******don't touch this folder*******/
const http = require('http')
const app = require('./app')


/********************************/
/**group communication routers***/
/********************************/

let io = require('socket.io')(http);
io.on('connection', (socket) => {
    console.log('user connected');
});
/********************************/


const port =  5010
const server = http.createServer(app)
server.listen(port)
