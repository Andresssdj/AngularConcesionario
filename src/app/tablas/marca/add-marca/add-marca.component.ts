import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { MarcaServiceService } from 'src/app/servicio/marca-service.service';

@Component({
  selector: 'app-add-marca',
  templateUrl: './add-marca.component.html',
  styleUrls: ['./add-marca.component.css']
})
export class AddMarcaComponent implements OnInit {

  marcaForm=new FormGroup({
  id:new FormControl(''),
  marca:new FormControl(''),
  });

  constructor(private api:MarcaServiceService, private router:Router){}
  ngOnInit(): void {

  }
  addMarca():void{
    let marca={
      id:this.marcaForm.get('id')?.value,
      marca:this.marcaForm.get('marca')?.value
  }
  this.api.crearMarca(marca).subscribe(Response=>{
    if(Response.status==="ok"){
      alert("Registo exitoso");
      this.router.navigate(['Marcas']);
    }
   });
  }
}
