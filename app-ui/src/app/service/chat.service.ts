import { Injectable } from '@angular/core';


import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { Router } from '@angular/router';
import { BehaviorSubject, Observable } from 'rxjs';

import { catchError, map } from 'rxjs/operators';

import * as io from 'socket.io-client';

import { environment } from './envirenment';

@Injectable({
  providedIn: 'root'
})
export class ChatService {

  //socket = io(environment.SOCKET_ENDPOINT);
  private socket;

  public message$: BehaviorSubject<string> = new BehaviorSubject('');


  constructor(private _httpClient: HttpClient) { 
  }
  contacts: any[];

  setupSocketConnection() {
    this.socket = io(environment.SOCKET_ENDPOINT, {
      withCredentials: true,
      extraHeaders: {
        "Access-Control-Allow-Headers": "*",
        "Access-Control-Request-Method": "*"
      }
    });
    this.socket.on('connection', this.connectUser());
    this.socket.emit('my message', 'Hello there from Angular.');

  }

  connectUser() { 
    var userId = localStorage.getItem("idUser")
    if (!userId) return;
    this.socket.emit('userConnected', userId);
  }
  
  disconnectUser() {  
    var userId = localStorage.getItem("idUser")
    if (!userId) return;
    this.socket.emit('userDisconnected', userId);
  }

  public sendMessage(message, id) {

    this.socket.emit("private message", {
      content: message,
      to: id,
    });

    this.socket.emit('my message', message);

    console.log("this is the message " + message);
  }

  public getMessages = () => {
   
            this.socket.on("private message", ({ content, from }) => {
              console.log("the message priv " + content);
                if (localStorage.getItem("idUser") === from) {
                  this.message$.next(content);
                  console.log("the message priv " + content);
                }
            });

   
}
  

    /**
     * Loader
     *
     * @returns {Promise<any> | any}
     */
    loadContacts(idUser): Promise<any> | any
    {
        return new Promise((resolve, reject) => {
            Promise.all([
                this.getContacts(idUser),
            ]).then(
                ([contacts]) => {
                    this.contacts =  contacts;
                    resolve();
                    console.log("load contacts :  " + JSON.stringify(this.contacts) + "\n");
                },
                reject
            );
        });
       
    }

    /**
     * Get contacts
     *
     * @returns {Promise<any>}
     */
    getContacts(idUser): Promise<any>
    {
        return new Promise((resolve, reject) => {
            this._httpClient.post(`${environment.SOCKET_ENDPOINT}/contact`, {id_user: idUser})
                .subscribe((response: any) => {
                    resolve(response.data);
                }, reject);
        });
    }

}
