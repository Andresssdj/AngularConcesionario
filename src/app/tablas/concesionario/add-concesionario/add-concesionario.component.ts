import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { ConcesionarioServiceService } from 'src/app/servicio/concesionario-service.service';

@Component({
  selector: 'app-add-concesionario',
  templateUrl: './add-concesionario.component.html',
  styleUrls: ['./add-concesionario.component.css']
})
export class AddConcesionarioComponent implements OnInit {

concesionarioForm=new FormGroup({
id:new FormControl(''),
ciudad:new FormControl(''),
direccion:new FormControl(''),
nombre:new FormControl(''),
telefono:new FormControl(''),
});

constructor(private api:ConcesionarioServiceService, private router:Router){}
ngOnInit(): void {

}
addConcesionario():void{
let concesionario={
  id:this.concesionarioForm.get('id')?.value,
  ciudad:this.concesionarioForm.get('ciudad')?.value,
  direccion:this.concesionarioForm.get('direccion')?.value,
  nombre:this.concesionarioForm.get('nombre')?.value,
  telefono:this.concesionarioForm.get('telefono')?.value
}
this.api.crearConcesionario(concesionario).subscribe(Response=>{
if(Response.status==="ok"){
alert("Registro exitoso");
this.router.navigate(['Concesionarios']);
}
});

}
}
