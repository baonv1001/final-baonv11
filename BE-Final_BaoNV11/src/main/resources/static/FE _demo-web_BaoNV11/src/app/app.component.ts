import {Component} from '@angular/core';
import {MessageService} from '../service/message.service';

declare var SockJS;
declare var Stomp;

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'File Management';
  input;


  constructor() {
  }
}
