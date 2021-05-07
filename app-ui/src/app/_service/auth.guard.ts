
import { Injectable } from '@angular/core';
import { CanActivate, CanActivateChild, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router } from '@angular/router';

import { Observable } from 'rxjs';
import { AuthService } from "./auth.service";

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {

  constructor(private authService: AuthService, private router: Router){}

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
): boolean {
    if (this.authService.getToken() != null) {
      console.log("error =>  ++++");
            return true;
    } else {
    
      try {  
        this.router.navigate(["/authentication/login"]); 
      
      }catch (e) { 
      
      if (typeof e === "string") {
          e.toUpperCase() // works, `e` narrowed to string
      } else if (e instanceof Error) {
          e.message // works, `e` narrowed to Error
      }
      console.log("error =>  " + e);
      }
        
        return false;
    }
}
  
}
