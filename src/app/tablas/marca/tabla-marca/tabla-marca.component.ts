import { Component, OnInit } from '@angular/core';
import { Marca } from 'src/app/model/marca';
import { MarcaServiceService } from 'src/app/servicio/marca-service.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-tabla-marca',
  templateUrl: './tabla-marca.component.html',
  styleUrls: ['./tabla-marca.component.css']
})
export class TablaMarcaComponent implements OnInit{
  listMarca: Marca []= [];
  marca={
    id_Marca:0,
    marca:""
  }

  constructor(private marcaService:MarcaServiceService){

  }

  id_Marca:number=0;
  condition:boolean=true;

  ngOnInit(): void {
   this.allMarca();
  }
  allMarca():void{

    this.marcaService.getAllMarca().subscribe(res=>{
    console.log(res);
    this.listMarca= res.data;
    })
  }

  delete(id_Marca:number):void{
    this.id_Marca=id_Marca
    this.confirmar()
}
confirmar():void{
  Swal.fire({
    title: "Marca",
    html: '<p>¿Eliminar? <br> Si acepta al momento de finalizar la accion recargue la paguina para que vea los cambios</p>',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: "Sí, eliminar",
    cancelButtonText: "Cancelar",
 })
 .then((resultado) => {
  if (resultado.value) {
      // Hicieron click en "Sí"
      this.marcaService.eliminar(this.id_Marca).subscribe(res=>{
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
