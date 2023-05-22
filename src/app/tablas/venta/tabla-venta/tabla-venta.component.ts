import { Component, OnInit } from '@angular/core';
import { Venta } from 'src/app/model/venta';
import { VentaServiceService } from 'src/app/servicio/venta-service.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-tabla-venta',
  templateUrl: './tabla-venta.component.html',
  styleUrls: ['./tabla-venta.component.css']
})
export class TablaVentaComponent implements OnInit {
  listVenta: Venta []=[];

  venta={
    id_Venta:0,
    fechaVenta: "",
    metodosDePago: "",
    montoTotal:""
  }

  constructor(private ventaService:VentaServiceService){

  }

  id_Venta:number=0;
  condition:boolean=true;

  ngOnInit(): void {
    this.allVenta();
  }
  allVenta():void{

    this.ventaService.getAllVenta().subscribe(res=>{
     console.log(res);
     this.listVenta= res.data;
    })
  }
  delete(id_Venta:number):void{
    this.id_Venta=id_Venta
    this.confirmar()
   }
  
  confirmar():void{
   Swal.fire({
     title: "Venta",
     html: '<p>¿Eliminar? <br> Si acepta al momento de finalizar la accion recargue la paguina para que vea los cambios</p>',
     icon: 'warning',
     showCancelButton: true,
     confirmButtonText: "Sí, eliminar",
     cancelButtonText: "Cancelar",
  })
  .then((resultado) => {
     if (resultado.value) {
         // Hicieron click en "Sí"
         this.ventaService.eliminar(this.id_Venta).subscribe(res=>{
           console.log("++++++",res);
         });
         console.log("*se elimina la venta*");
     } else  if (resultado.dismiss === Swal.DismissReason.cancel) {
         // Dijeron que no
         console.log("*NO se elimina la venta*");
     }
  });
  
  }
  editar():void{
   this.condition=false
  }
  }
  


