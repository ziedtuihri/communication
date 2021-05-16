import { BrowserModule } from '@angular/platform-browser';
import { NgModule, NO_ERRORS_SCHEMA} from '@angular/core';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AdminComponent } from './layout/admin/admin.component';
import { SharedModule} from './shared/shared.module';
import { BrowserAnimationsModule} from '@angular/platform-browser/animations';
import { HomePageComponent } from './home-page/home-page.component';
import { PopupComponent } from './popup/popup.component';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DocumentService } from './service/document.service';

import { AuthGuard } from "./service/auth.guard";


@NgModule({
  declarations: [
    AppComponent,
    AdminComponent,
    HomePageComponent,
    PopupComponent,
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    SharedModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
  ],
  entryComponents: [PopupComponent],
  schemas: [ NO_ERRORS_SCHEMA ],
  providers: [ DocumentService, AuthGuard ],
  bootstrap: [AppComponent]
})
export class AppModule { }
