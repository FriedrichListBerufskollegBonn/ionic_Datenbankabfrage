import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-list',
  templateUrl: 'list.page.html',
  styleUrls: ['list.page.scss']
})
export class ListPage  {
   meldungen:any;
  constructor(public httpClient: HttpClient) { 
    this.meldungen = this.httpClient.get('https://feed2json.org/convert?url=http%3A%2F%2Fwww.tagesschau.de%2Fxml%2Frss2');
    this.meldungen
    .subscribe(data => {
      console.log('my data: ', data.records);
    })
  }
}
