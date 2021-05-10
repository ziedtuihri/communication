import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { Router } from '@angular/router';
import { throwError, Observable } from 'rxjs';
import { catchError, map } from 'rxjs/operators';
import { FuseUtils } from '@fuse/utils';

import * as io from 'socket.io-client';

import { AuthService } from '../../../auth/auth.service';
import { environment } from './envirenment';
@Injectable()
export class ChatPanelService
{
    contacts: any[];
    contacts2: any[];
    chats: any[];
    user: any;
    endpoint: string = AuthService.endpoint;
    headers = new HttpHeaders().set('Content-Type', 'application/json');
    private socket;

    user2 = AuthService.currentUser;

    /**
     * Constructor
     *
     * @param {HttpClient} _httpClient
     */
    constructor(
        private _httpClient: HttpClient,
        public router: Router
    )
    {
    }

    setupSocketConnection() {
    
        this.socket = io(environment.SOCKET_ENDPOINT, {
            withCredentials: true,
            extraHeaders: {
              "Access-Control-Allow-Headers": "*",
              "Access-Control-Request-Method": "*"
            }
        });

        this.socket.emit('my message', 'Hello there from Angular.');

        /*
        this.socket.emit('my message', 'Hello there from Angular.');
    
        this.socket.on('my broadcast', (data: string) => {
          console.log(data);
        });*/
      }


    /**
     * Loader
     *
     * @returns {Promise<any> | any}
     */
    loadContacts(): Promise<any> | any
    {
        return new Promise((resolve, reject) => {
            Promise.all([
                this.getContacts(),
                this.getUser(),
                this.getContacts2()
            ]).then(
                ([ contacts, user, contacts2]) => {
                    this.user = user;
                    this.contacts =  contacts2;
                    resolve();
                    console.log("load user :  " + JSON.stringify(this.user) + "\n");
                    console.log("load contacts :  " + JSON.stringify(this.contacts) + "\n");
                },
                reject
            );
        });
       
    }

    /**
     * Get chat
     *
     * @param contactId
     * @returns {Promise<any>}
     */
    getChat(contactId): Promise<any>
    {
        const chatItem = this.user.chatList.find((item) => {
            return item.contactId === contactId;
        });

        // Get the chat
        return new Promise((resolve, reject) => {

            // If there is a chat with this user, return that.
            if ( chatItem )
            {
                this._httpClient.get('api/chat-panel-chats/' + chatItem.chatId)
                    .subscribe((chat) => {

                        // Resolve the promise
                        resolve(chat);
                        console.log("****" + JSON.stringify(chat))
                    }, reject);
            }
            // If there is no chat with this user, create one...
            else
            {
                this.createNewChat(contactId).then(() => {

                    // and then recall the getChat method
                    this.getChat(contactId).then((chat) => {
                        resolve(chat);
                    });
                });
            }
        });
    }

    /**
     * Create new chat
     *
     * @param contactId
     * @returns {Promise<any>}
     */
    createNewChat(contactId): Promise<any>
    {
        return new Promise((resolve, reject) => {

            // Generate a new id
            const chatId = FuseUtils.generateGUID();

            // Prepare the chat object
            const chat = {
                id    : chatId,
                dialog: []
            };

            // Prepare the chat list entry
            const chatListItem = {
                chatId         : chatId,
                contactId      : contactId,
                lastMessageTime: '2017-02-18T10:30:18.931Z'
            };

            // Add new chat list item to the user's chat list
            this.user.chatList.push(chatListItem);

            // Post the created chat to the server
            this._httpClient.post('api/chat-panel-chats', {...chat})
                .subscribe(() => {

                    // Post the updated user data to the server
                    this._httpClient.post('api/chat-panel-user/' + this.user.id, this.user)
                        .subscribe(() => {
                            console.log("****" + JSON.stringify(chat))
                            // Resolve the promise
                            resolve();
                        });
                }, reject);
        });
    }

    /**
     * Update the chat
     *
     * @param chatId
     * @param dialog
     * @returns {Promise<any>}
     */
    updateChat(chatId, dialog): Promise<any>
    {
        return new Promise((resolve, reject) => {

            const newData = {
                id    : chatId,
                dialog: dialog
            };

            this._httpClient.post('api/chat-panel-chats/' + chatId, newData)
                .subscribe(updatedChat => {
                    resolve(updatedChat);
                }, reject);
        });
    }

    /**
     * Get contacts
     *
     * @returns {Promise<any>}
     */
    getContacts(): Promise<any>
    {
        return new Promise((resolve, reject) => {
            // all contact Fuse 'api/chat-panel-contacts'
            // `http://localhost:5010/chat/contact`, {id_user: "123456"} response.data
            this._httpClient.get('api/chat-panel-contacts')
                .subscribe((response: any) => {
                    resolve(response);
                    console.log("++++" + response[0])

                }, reject);
        });
    }


    /**
     * Get contacts
     *
     * @returns {Promise<any>}
     */
    getContacts2(): Promise<any>
    {
        return new Promise((resolve, reject) => {
            // all contact Fuse 'api/chat-panel-contacts'
            // `http://localhost:5010/chat/contact`, {id_user: "123456"} response.data
            this._httpClient.post(`http://localhost:5010/chat/contact`, {id_user: "123456"})
                .subscribe((response: any) => {
                    resolve(response.data);
                    console.log("++++" + JSON.stringify(response.data))

                }, reject);
        });
    }

    /**
     * Get user
     *
     * @returns {Promise<any>}
     */
    getUser(): Promise<any>
    {
        
        return new Promise((resolve, reject) => {
            //`${this.endpoint}/`
            this._httpClient.get('api/chat-panel-user')
                .subscribe((response: any) => {
                    resolve(response[0]);
                    console.log("----" + response[0])
                }, reject);
        });
    }
}
