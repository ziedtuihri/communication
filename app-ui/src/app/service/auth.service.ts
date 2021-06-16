import { Injectable } from '@angular/core';
import { User } from './user';
import { Observable, throwError } from 'rxjs';
import { catchError, map } from 'rxjs/operators';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  endpoint: string = 'http://localhost:5010';
  headers = new HttpHeaders().set('Content-Type', 'application/json');
  
    static currentUser = {};
    static endpoint: string;

  constructor(
    private http: HttpClient,
    public router: Router
  ) {}

  getToken() {
    return localStorage.getItem('access_token_school');
  }

      // Sign-up
      signUp(user: User): Observable<any> {
        let api = `${this.endpoint}/singup`;
        return this.http.post(api, user)
          .pipe(
            catchError(this.handleError)
          )
      }
    
      // Sign-in
      signIn(user: User) {
        
        return this.http.post<any>(`${this.endpoint}/auth/login`, user)
          .subscribe((res: any) => {

            if(res.message == "user not found"){

            }else{
              localStorage.setItem('access_token_school', res.token)
              localStorage.setItem("idUser", res.data.id_user)
              console.log(user.email + "this user is sending " + JSON.stringify(res) + 
              "\n " + JSON.stringify(AuthService.currentUser) + "\n" +
              localStorage.getItem("idUser")
              );
              this.router.navigate(['']);
            }
          })
      }
  
      get isLoggedIn(): boolean {
        let authToken = localStorage.getItem('access_token_school');
        return (authToken !== null) ? true : false;
      }
    
      doLogout() {
        let removeToken = localStorage.removeItem('access_token_school');
        /*if (removeToken == null) {
          this.router.navigate(['/authentication/login']);
        }*/
      }
    
      // User profile
      getUserProfile(id): Observable<any> {
        let api = `${this.endpoint}/user-profile/${id}`;
        return this.http.get(api, { headers: this.headers }).pipe(
          map((res: Response) => {
            return res || {}
          }),
          catchError(this.handleError)
        )
      }
    
      // Error 
      handleError(error: HttpErrorResponse) {
        let msg = '';
        if (error.error instanceof ErrorEvent) {
          // client-side error
          msg = error.error.message;
        } else {
          // server-side error
          msg = `Error Code: ${error.status}\nMessage: ${error.message}`;
        }
        return throwError(msg);
      }

}
