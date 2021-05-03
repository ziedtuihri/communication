import { Injectable } from '@angular/core';
import { CanActivate, CanActivateChild, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from "./auth.service";


@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate, CanActivateChild {

  constructor(private authService: AuthService, private router: Router){}


  canActivateChild(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
): boolean {
    if (this.authService.getToken() != null) {
            return true;
    } else {
        this.router.navigate(["/pages/auth/login-2"]);
        return false;
    }
}

canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
): boolean {
    if (this.authService.getToken() != null) {
            return true;
    } else {
        this.router.navigate(["/pages/auth/login-2"]);
        return false;
    }
}
  
}
