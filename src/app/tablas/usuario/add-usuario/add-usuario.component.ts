import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { UsuarioService } from 'src/app/servicio/service.service';



@Component({
  selector: 'app-add-usuario',
  templateUrl: './add-usuario.component.html',
  styleUrls: ['./add-usuario.component.css']
})
export class AddUsuarioComponent implements OnInit {

  usuarioForm=new FormGroup({
    id:new FormControl(''),
    nombre:new FormControl(''),
    apellido:new FormControl(''),
    correo:new FormControl(''),
    telefono:new FormControl(''),
    fechaNacimiento:new FormControl(''),
  });

  constructor(private api:UsuarioService, private router:Router){}
  ngOnInit(): void {

  }
  addUsuario():void{
    let usuario={
      id:this.usuarioForm.get('id')?.value,
      nombre:this.usuarioForm.get('nombre')?.value,
      apellido:this.usuarioForm.get('apellido')?.value,
      correo:this.usuarioForm.get('correo')?.value,
      telefono:this.usuarioForm.get('telefono')?.value,
      fechaNacimiento:this.usuarioForm.get('fechaNacimiento')?.value
    }
    this.api.crearUsuario(usuario).subscribe(Response=>{
      if(Response.status==="ok"){
        alert("Registo exitoso");
        this.router.navigate(['Usuarios']);
      }
    });
  }
}
