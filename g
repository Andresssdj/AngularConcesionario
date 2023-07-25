<mat-menu #versions="matMenu">
                <div *ngFor="let vr of listTef">
                    <button mat-menu-item *ngIf="vr.id != null && vr.id != ''"
                        (click)="getFilesVersionId(vr.id)">
                        {{ vr.value }}
                    </button>
                </div>
            </mat-menu>



getFilesVersionId(id: string) {
    if (id != 'all') {
      this.changeService.requestGetFilesById(0, id).subscribe(
        response => {
          this.dataSource.data = response as UpdateDownloadDTO[];
        }, error => {
          console.log('Sin archivos por la version seleccionada');
        })
  }
}
