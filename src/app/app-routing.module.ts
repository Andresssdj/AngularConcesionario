import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TablaVehiculoComponent } from './tablas/vehiculo/tabla-vehiculo/tabla-vehiculo.component';
import { TablaConcesionarioComponent } from './tablas/concesionario/tabla-concesionario/tabla-concesionario.component';
import { TablaMarcaComponent } from './tablas/marca/tabla-marca/tabla-marca.component';
import { TablaRolComponent } from './tablas/rol/tabla-rol/tabla-rol.component';
import { TablaUsuarioComponent } from './tablas/usuario/tabla-usuario/tabla-usuario.component';
import { TablaVentaComponent } from './tablas/venta/tabla-venta/tabla-venta.component';
import { AddUsuarioComponent } from './tablas/usuario/add-usuario/add-usuario.component';
import { AddConcesionarioComponent } from './tablas/concesionario/add-concesionario/add-concesionario.component';
import { AddVentaComponent } from './tablas/venta/add-venta/add-venta.component';
import { AddRolComponent } from './tablas/rol/add-rol/add-rol.component';
import { AddMarcaComponent } from './tablas/marca/add-marca/add-marca.component';
import { AddVehiculoComponent } from './tablas/vehiculo/add-vehiculo/add-vehiculo.component';


const routes: Routes = [
  { path: 'Vehiculos', component: TablaVehiculoComponent },
  { path: 'Concesionarios', component: TablaConcesionarioComponent   },
  { path: 'Marcas', component: TablaMarcaComponent },
  { path: 'Roles', component: TablaRolComponent },
  { path: 'Usuarios', component: TablaUsuarioComponent},
  { path: 'Ventas', component: TablaVentaComponent},
  { path: 'crear-usuario', component: AddUsuarioComponent},
  { path: 'crear-concesionario', component: AddConcesionarioComponent},
  { path: 'crear-venta', component: AddVentaComponent},
  { path: 'crear-rol', component: AddRolComponent},
  { path: 'crear-marca', component: AddMarcaComponent},
  { path: 'crear-vehiculo', component: AddVehiculoComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule
  ]
})
export class AppRoutingModule { }
