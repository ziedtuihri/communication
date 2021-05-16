import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { AuthService } from "../../../../service/auth.service";

import { FormBuilder, FormGroup, FormControl, Validators } from '@angular/forms';



@Component({
  selector: 'app-basic-login',
  templateUrl: './basic-login.component.html',
  styleUrls: ['./basic-login.component.scss']
})
export class BasicLoginComponent implements OnInit {

  loginForm: FormGroup;

  constructor( 
    private _formBuilder: FormBuilder,
    private authService: AuthService 
    ) { }

    /**
     * On init
     */
    ngOnInit(): void
    {
        this.loginForm = this._formBuilder.group({
            email   : ['', [Validators.required, Validators.email]],
            password: ['', Validators.required]
        });
    }

    onSubmit(event) {
      event.preventDefault();
      if (!this.loginForm.valid) return;

      this.authService.signIn(this.loginForm.value);
      console.log(this.loginForm.value);
  }

}
