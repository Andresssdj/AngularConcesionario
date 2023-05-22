import { Component, OnInit } from '@angular/core';
import { UsuarioService } from 'src/app/servicio/service.service';
import { Usuario } from 'src/app/model/Usuario';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-tabla-usuario',
  templateUrl: './tabla-usuario.component.html',
  styleUrls: ['./tabla-usuario.component.css']
})
export class TablaUsuarioComponent implements OnInit{
listUser: Usuario []= [];

usuario={
  id_Usuario:0,
  nombre:"",
  apellido:"",
  correo: "",
  telefono: "",
  fechaNacimiento: ""
}
constructor(private usuarioService:UsuarioService){

}
id_Usuario:number=0;
condition:boolean=true;

 ngOnInit(): void {

    this.allUser();
  }
  allUser():void {

    this.usuarioService.getAllUsuario().subscribe(res=>{
      console.log(res);
      this.listUser= res.data;
    })
  }
 delete(id_Usuario:number):void{
    this.id_Usuario=id_Usuario
    this.confirmar()
   }
  
  confirmar():void{
   Swal.fire({
     title: "Usuario",
     html: '<p>¿Eliminar? <br> Si acepta al momento de finalizar la accion recargue la paguina para que vea los cambios</p>',
     icon: 'warning',
     showCancelButton: true,
     confirmButtonText: "Sí, eliminar",
     cancelButtonText: "Cancelar",
  })
  .then((resultado) => {
     if (resultado.value) {
         // Hicieron click en "Sí"
         this.usuarioService.eliminar(this.id_Usuario).subscribe(res=>{
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
  


