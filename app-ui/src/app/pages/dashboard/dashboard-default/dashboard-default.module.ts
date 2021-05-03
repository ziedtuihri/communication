import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DashboardDefaultRoutingModule } from './dashboard-default-routing.module';
import { DashboardDefaultComponent } from './dashboard-default.component';
import {SharedModule} from '../../../shared/shared.module';
import {ChartModule} from 'angular2-chartjs';

import { AuthGuard } from "../../../service/auth.guard";
import { AuthService } from "../../../service/auth.service";

@NgModule({
  imports: [
    CommonModule,
    DashboardDefaultRoutingModule,
    SharedModule,
    ChartModule
  ],
  providers: [AuthService, AuthGuard],
  declarations: [DashboardDefaultComponent]
})
export class DashboardDefaultModule { }
