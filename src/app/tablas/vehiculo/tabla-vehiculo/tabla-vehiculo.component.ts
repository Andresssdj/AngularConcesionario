import { Component, OnInit } from '@angular/core';
import { Vehiculo } from 'src/app/model/vehiculo';
import { VehiculoServiceService } from 'src/app/servicio/vehiculo-service.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-tabla-vehiculo',
  templateUrl: './tabla-vehiculo.component.html',
  styleUrls: ['./tabla-vehiculo.component.css']
})
export class TablaVehiculoComponent implements OnInit {
listVehiculos: Vehiculo []=[];

vehiculo={
    id_Vehiculo:0,
    modelo:"",
    centimetrosCubicos:"",
    placa:"",
    precio:"",
    color:""
}
constructor(private vehiculoService:VehiculoServiceService){

}
id_Vehiculo:number=0;
  condition:boolean=true;

ngOnInit(): void {
  this.allVehiculo();
  }
 allVehiculo():void{

  this.vehiculoService.getAllVehiculo().subscribe(res=>{
   console.log(res);
   this.listVehiculos= res.data;
  })
 }
 delete(id_Vehiculo:number):void{
  this.id_Vehiculo=id_Vehiculo
  this.confirmar()
 }

confirmar():void{
 Swal.fire({
   title: "Vehiculo",
   html: '<p>¿Eliminar? <br> Si acepta al momento de finalizar la accion recargue la paguina para que vea los cambios</p>',
   icon: 'warning',
   showCancelButton: true,
   confirmButtonText: "Sí, eliminar",
   cancelButtonText: "Cancelar",
})
.then((resultado) => {
   if (resultado.value) {
       // Hicieron click en "Sí"
       this.vehiculoService.eliminar(this.id_Vehiculo).subscribe(res=>{
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
