import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {
  mitarbeiter:any;
  constructor(public httpClient: HttpClient) { 
    this.mitarbeiter = this.httpClient.get('http://localhost/api.php/records/mitarbeiter/');
    this.mitarbeiter
    .subscribe(data => {
      console.log('my data: ', data.records);
    })
  }
}
/*
https://ionicacademy.com/http-calls-ionic/
http://localhost/m/api.php/records/mitarbeiter/
https://github.com/mevdschee/php-crud-api
*/
