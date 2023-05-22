import { Component, OnInit } from '@angular/core';
import { Rol } from 'src/app/model/rol';
import { RolServiceService } from 'src/app/servicio/rol-service.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-tabla-rol',
  templateUrl: './tabla-rol.component.html',
  styleUrls: ['./tabla-rol.component.css']
})
export class TablaRolComponent implements OnInit{
listRoles: Rol [] =[];
rol={
  id:0,
  nombre:""
}
constructor (private rolService: RolServiceService){

}

 id:number=0;
  condition:boolean=true;

  ngOnInit(): void {
    this.allRol();
  }

  allRol():void{
    this.rolService.getAllRol().subscribe(res=>{
      console.log('>>>>>>>>>>>', res);
      this.listRoles=res.data;

    })
  }

delete(id:number):void{
  this.id=id
  this.confirmar()
 }

confirmar():void{
 Swal.fire({
   title: "Rol",
   html: '<p>¿Eliminar? <br> Si acepta al momento de finalizar la accion recargue la paguina para que vea los cambios</p>',
   icon: 'warning',
   showCancelButton: true,
   confirmButtonText: "Sí, eliminar",
   cancelButtonText: "Cancelar",
})
.then((resultado) => {
   if (resultado.value) {
       // Hicieron click en "Sí"
       this.rolService.eliminar(this.id).subscribe(res=>{
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
