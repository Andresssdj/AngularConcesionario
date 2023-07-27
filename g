  // ==== Filtrado de tabla de terminales
  selectProgramas: boolean = false;
  lenghtCodTerm: number;
  codigoSearch: string;

  tableFilter(event: Event) {

    this.right = 1;
    this.left = -1;
    const filterValue = (event.target as HTMLInputElement).value;
    this.codigoSearch = filterValue.toUpperCase();
    this.lenghtCodTerm = filterValue.length;

    if (filterValue.length > 3) {
      this.pageListCodigosTerminal(0, this.codigoSearch);
    } else if (filterValue.length == 0) {
      this.ngOnInit();
    }

    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
  
  
  
  
   pageListCodigosTerminal(pagina: number, codigo: string) {
    this.paginaActual = pagina;
    this.serviceTerminal.requestGetTerminalByCodTerminal(codigo, pagina).subscribe({
      next: (response: any) => {
        console.log('Response terminal list OK page search');
        this.dataSource.data = response as Terminal[];
      }, error(response: any) {
        console.log('Error al obtener la lista de terminales en component:', response)
      }
    });
  }


SELECT u.id as id, SUBSTR(u.value, INSTR(u.value, 'NOMBREARCHIVO=') + LENGTH('NOMBREARCHIVO='),
INSTR(u.value, '|', INSTR(u.value, 'NOMBREARCHIVO=')) - INSTR(u.value, 'NOMBREARCHIVO=') - LENGTH('NOMBREARCHIVO=')) as value
FROM Update_Download u WHERE u.value LIKE '%tef_legacy%' AND u.criterio LIKE '%> 1%' ORDER BY u.id DESC;


{"tef_legacy":"[PARAMS]ISTEFON=1|MODETEF2=0|ISANULACION=1|ISCIERRE=0|ISBONOREGALO=1|ISAVANCE=1|ISPAGOMOVIL=1|ISBONOVIRTUAL=1|ISRECARGACELULAR=1|ISCUPON=1|[RS232]ISRS232=1|COMPORT=0|PHYSICALCOMPORT=0|NUMBERDATABITS=8|PARITY=N|STOPBITS=1|BAUDRATE=9600|[ETHERNET]ISETHERNET=0|IPHOST=0|PORTHOST=0|[USB]ISUSB=0|[TEFCLOUD]ISTEFCLOUD=0|[VARIABLES]NOMBREARCHIVO=Configuracion tef 1|STIMEOUTCU=60|STIMEOUTME=60|STIMEOUTSC=60|FKCSIGN=30|MXSIGNTOUT=45|SIGNATUREW=0|SIGNRETRIES=2|BEEPLEVEL=10|BLOCKMAGNETIC=0|SETADFIELDS=0|SENDTRACKS=0|BLOCKCREDITCARD=0|CIERREAUTO=NULL|SETPRINTER=0|ACTNUMRECEIPT=0|DELAYSLAN=0|SETOFFCAMPS=53|SETONACK=0|EXCLUSIVOFALA=0|"}

    @Query("SELECT t FROM Terminal t WHERE t.codigoTerminal LIKE %:codigo% OR t.codigoUnico LIKE %:codigo% OR t.serial LIKE %:codigo%")
