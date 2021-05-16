import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { HomePageComponent } from "./home-page/home-page.component";
import { AuthGuard } from "./service/auth.guard";

import { AuthComponent } from './layout/auth/auth.component';

const routes: Routes = [
  {
    path: '',
    component: HomePageComponent,
    canActivate : [ AuthGuard ] ,
    canActivateChild : [ AuthGuard ],
    children: [
      {
        path: '',
        redirectTo: 'dashboard',
        pathMatch: 'full',
      },
    ],
  },
  {
    path: '',
    children: [
      {
        path: 'authentication',
        loadChildren: () => import('./pages/auth/auth.module').then(m => m.AuthModule)
      }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
