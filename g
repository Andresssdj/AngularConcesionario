viewInformationTef(modal: any, dtoConfigTef: UpdateDownloadDTO) {
    this.dtoConfigParamsTef = dtoConfigTef;
    this.openModal(modal, 'xl');
  }

  openModal(modal: any, type: any) {
    this.modal.open(modal, { size: type });
  }



params : string[] = ['ISTEFON','MODETEF2','ISANULACION','ISCIERRE','ISBONOREGALO','ISAVANCE','ISPAGOMOVIL','ISBONOVIRTUAL','ISRECARGACELULAR','ISCUPON'];
