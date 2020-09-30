import {Component, OnInit} from '@angular/core';
import {FileService} from '../../../service/file.service';
import {HttpEventType, HttpResponse} from '@angular/common/http';

@Component({
  selector: 'app-files',
  templateUrl: './files.component.html',
  styleUrls: ['./files.component.scss']
})
export class FilesComponent implements OnInit {

  selectedFiles: FileList;
  currentFile: File;
  progress = 0;
  message = '';

  fileInfos: Observable<any>;
  contents: [];
  baseUrl = 'http://localhost:8100/web-demo/api/web/documents/download-file/1';

  constructor(private fileService: FileService) { }

  ngOnInit() {
    this.fileInfos = this.fileService.getFiles();
    this.fileService.getFiles().subscribe(resp => {
      if (resp && resp.rows) {
        this.contents = resp.rows;
      }
    });
  }

  selectFile(event) {
    this.selectedFiles = event.target.files;
  }

  upload() {
    this.progress = 0;

    this.currentFile = this.selectedFiles.item(0);
    this.fileService.upload(this.currentFile).subscribe(
      event => {
        if (event.type === HttpEventType.UploadProgress) {
          this.progress = Math.round(100 * event.loaded / event.total);
        } else if (event instanceof HttpResponse) {
          this.message = event.body.message;
          this.fileService.getFiles().subscribe(resp => {
            if (resp && resp.rows) {
              this.contents = resp.rows;
            }
          });
        }
      },
      err => {
        this.progress = 0;
        this.message = 'Could not upload the file!';
        this.currentFile = undefined;
      });

    this.selectedFiles = undefined;
  }

}
