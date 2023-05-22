import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { VentaServiceService } from 'src/app/servicio/venta-service.service';

@Component({
  selector: 'app-add-venta',
  templateUrl: './add-venta.component.html',
  styleUrls: ['./add-venta.component.css']
})
export class AddVentaComponent implements OnInit {

  ventaForm=new FormGroup({
    id_Venta:new FormControl(''),
    fechaVenta:new FormControl(''),
    metodosDePago:new FormControl(''),
    montoTotal:new FormControl(''),
  });

constructor(private api:VentaServiceService, private router:Router){}
ngOnInit(): void {

}
addVenta(): void{
  let venta={
    id_Venta:this.ventaForm.get('id')?.value,
    fechaVenta:this.ventaForm.get('fechaVenta')?.value,
    metodosDePago:this.ventaForm.get('metodosDePago')?.value,
    montoTotal:this.ventaForm.get('montoTotal')?.value
  }
  this.api.crearVenta(venta).subscribe(Response=>{
    if(Response.status==="ok"){
      alert("Registo exitoso");
      this.router.navigate(['Ventas']);
    }
  });
  }
}
