import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { RolServiceService } from 'src/app/servicio/rol-service.service';

@Component({
  selector: 'app-add-rol',
  templateUrl: './add-rol.component.html',
  styleUrls: ['./add-rol.component.css']
})
export class AddRolComponent implements OnInit{

  rolForm=new FormGroup({
   id:new FormControl(''),
   rol:new FormControl(''),
  });

  constructor(private api:RolServiceService, private router:Router){}
  ngOnInit(): void {

  }
  addRol():void{
    let rol={
      id:this.rolForm.get('id')?.value,
      nombre:this.rolForm.get('rol')?.value
    }
    this.api.crearRol(rol).subscribe(Response=>{
      if(Response.status==="ok"){
        alert("Registo exitoso");
        this.router.navigate(['Roles']);
      }
    });
  }
}
