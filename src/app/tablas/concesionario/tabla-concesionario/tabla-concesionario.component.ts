import { Component, OnInit } from '@angular/core';
import { Concesionario } from 'src/app/model/concesionario';
import { ConcesionarioServiceService } from 'src/app/servicio/concesionario-service.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-tabla-concesionario',
  templateUrl: './tabla-concesionario.component.html',
  styleUrls: ['./tabla-concesionario.component.css']
})
export class TablaConcesionarioComponent implements OnInit {
  listConcesionario: Concesionario []=[];

  concesionario={
    id_Concesionario:0,
    nombre:"",
    direccion:"",
    telefono:"",
    ciudad:""
  }
  constructor(private concesionarioService:ConcesionarioServiceService){

  }
  id_Concesionario:number=0;
  condition:boolean=true;

  ngOnInit(): void {
    this.allConcesionario();
  }
  allConcesionario():void{

     this.concesionarioService.getAllConcesionario().subscribe(res=>{
      console.log(res);
      this.listConcesionario= res.data;
     })
  }
  delete(id_Concesionario:number):void{
    this.id_Concesionario=id_Concesionario
    this.confirmar()
   }
  
  confirmar():void{
   Swal.fire({
     title: "Concesionario",
     html: '<p>¿Eliminar? <br> Si acepta al momento de finalizar la accion recargue la paguina para que vea los cambios</p>',
     icon: 'warning',
     showCancelButton: true,
     confirmButtonText: "Sí, eliminar",
     cancelButtonText: "Cancelar",
  })
  .then((resultado) => {
     if (resultado.value) {
         // Hicieron click en "Sí"
         this.concesionarioService.eliminar(this.id_Concesionario).subscribe(res=>{
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
  
